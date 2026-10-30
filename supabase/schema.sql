-- Run once as project owner in Supabase SQL editor.
begin;
create table public.workspace_members(email text primary key check(email=lower(email)));
insert into public.workspace_members values ('tomas.fnk@gmail.com');
alter table public.workspace_members enable row level security;
revoke all on public.workspace_members from anon,authenticated;

create table public.quote_workspace (
 id boolean primary key default true check(id),
 version integer not null default 0,
 data jsonb not null default '{"projects":[],"supplier":{}}',
 updated_at timestamptz not null default now(),
 updated_by uuid
);
insert into public.quote_workspace(id) values(true);
alter table public.quote_workspace enable row level security;
revoke all on public.quote_workspace from anon,authenticated;

-- All data access goes through these functions. No service-role key in the app.
create function public.require_workspace_member() returns void
language plpgsql security definer set search_path='' as $$
begin
 if auth.uid() is null or not exists (
   select 1 from public.workspace_members m join auth.users u on lower(u.email)=m.email
   where u.id=auth.uid() and u.email_confirmed_at is not null
   and u.raw_app_meta_data->>'provider'='google'
 ) then raise exception 'Access denied' using errcode='42501'; end if;
end $$;

create function public.get_workspace() returns jsonb
language plpgsql security definer set search_path='' as $$
declare w public.quote_workspace; kept jsonb;
begin
 perform public.require_workspace_member();
 select * into w from public.quote_workspace where id=true for update;
 select coalesce(jsonb_agg(p),'[]'::jsonb) into kept
 from jsonb_array_elements(w.data->'projects') p
 where p->>'deletedAt' is null or (p->>'deletedAt')::timestamptz > now()-interval '30 days';
 if kept is distinct from w.data->'projects' then
   update public.quote_workspace set data=jsonb_set(data,'{projects}',kept),version=version+1,updated_at=now() where id=true returning * into w;
 end if;
 return jsonb_build_object('version',w.version,'data',w.data);
end $$;

create function public.save_workspace(expected_version integer,payload jsonb) returns jsonb
language plpgsql security definer set search_path='' as $$
declare w public.quote_workspace;
begin
 perform public.require_workspace_member();
 if jsonb_typeof(payload->'projects') is distinct from 'array' or jsonb_typeof(payload->'supplier') is distinct from 'object' or octet_length(payload::text)>5000000 then
   raise exception 'Invalid payload';
 end if;
 select * into w from public.quote_workspace where id=true for update;
 if w.version<>expected_version then
   return jsonb_build_object('conflict',true,'current',jsonb_build_object('version',w.version,'data',w.data));
 end if;
 update public.quote_workspace set data=payload,version=version+1,updated_at=now(),updated_by=auth.uid() where id=true returning * into w;
 return jsonb_build_object('conflict',false,'version',w.version);
end $$;
revoke all on function public.require_workspace_member() from public,anon,authenticated;
revoke all on function public.get_workspace() from public,anon;
revoke all on function public.save_workspace(integer,jsonb) from public,anon;
grant execute on function public.get_workspace() to authenticated;
grant execute on function public.save_workspace(integer,jsonb) to authenticated;
commit;
