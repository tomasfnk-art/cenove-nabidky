module.exports = async function handler(req,res) {
  res.setHeader('Cache-Control','no-store');
  const url=process.env.SUPABASE_URL||null,key=process.env.SUPABASE_PUBLISHABLE_KEY||null;
  let googleEnabled=null;
  if(url&&key){try{const r=await fetch(url+'/auth/v1/settings',{headers:{apikey:key},signal:AbortSignal.timeout(5000)});if(r.ok)googleEnabled=(await r.json()).external?.google===true}catch{}}
  res.json({url,key,googleEnabled});
};
