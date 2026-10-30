# Aktivace společného prostoru

Implementace používá Supabase Postgres + Supabase Auth (Google). Vercel nadále hostuje aplikaci. Bez konfigurace je přístupná jen přihlašovací stránka a oddělený náhled s ukázkovými daty. Náhled není synchronizován.

1. Vytvořte projekt v Supabase. Spusťte `supabase/schema.sql` v SQL editoru jako vlastník.
2. V Google Cloud vytvořte OAuth klienta typu Web. Callback URI je adresa z nastavení Google provideru v Supabase (`https://PROJECT.supabase.co/auth/v1/callback`). Nastavte audience/test uživatele dle zvoleného režimu aplikace. Client ID a secret vložte pouze do Supabase Auth → Providers → Google.
3. V Supabase Auth URL Configuration nastavte Site URL na `https://cenove-nabidky-tomas-fnk.vercel.app/`. Přidejte tuto přesnou adresu i mezi Redirect URLs. Pro ověření preview přidejte také jeho přesnou adresu; nepoužívejte široké wildcardy.
4. Ve Vercelu nastavte `SUPABASE_URL` a `SUPABASE_PUBLISHABLE_KEY` (veřejný publishable/anon klíč, nikdy service_role). Nastavte Production i Preview a znovu nasaďte.
5. Přihlaste se účtem tomas.fnk@gmail.com. Na druhém zařízení se přihlaste stejným účtem. Ověřte vytvoření nabídky, změnu nastavení, konflikt souběžných změn, koš a obnovu, zamítnutí jiného Google účtu a bílé PDF.

Druhý uživatel se povolí až po aktivaci jeho Google účtu příkazem v SQL editoru:
`insert into public.workspace_members(email) values ('hello@dominikbednar.com');`

Oprávnění mají oba stejná. Členové se nemění z klientské aplikace. Případné odebrání adresy se projeví při dalším požadavku.

## Souběžné úpravy
Celý malý společný prostor se ukládá atomicky s číslem verze. Konflikt i při změně různých nabídek je konzervativní a záměrný: ukáže obě verze, dovolí stáhnout vlastní změny jako JSON a načíst společnou verzi. Neprovádí automatické slučování ani tiché přepsání. Změny se čtou každých 10 sekund, při aktivním psaní se načítání odloží. Neuložená data zůstávají v otevřené záložce, při zavření prohlížeč varuje.

## Koš
Obnova do 30 dní. Při nejbližším načtení prostoru se starší smazané nabídky odstraní v databázové transakci. Nejde o pravidelnou denní úlohu ani zálohovací službu.

## Ověřené zdroje
https://supabase.com/docs/guides/auth/social-sign-in/auth-google
https://supabase.com/docs/guides/database/postgres/row-level-security
