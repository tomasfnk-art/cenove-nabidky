// Publish only the app and public Supabase connection settings.
const fs=require('node:fs'),path=require('node:path');
const url=process.env.SUPABASE_URL,key=process.env.SUPABASE_PUBLISHABLE_KEY;
if(!url||!key)throw new Error('Set SUPABASE_URL and SUPABASE_PUBLISHABLE_KEY in Netlify before building.');
if(!key.startsWith('sb_publishable_'))throw new Error('Only a public Supabase publishable key belongs in the frontend.');
if(new URL(url).protocol!=='https:')throw new Error('Supabase URL must use HTTPS.');
const out=path.join(__dirname,'dist');fs.mkdirSync(out,{recursive:true});
for(const file of ['index.html','theme.css','workspace.js','cloud.js','manifest.webmanifest','_headers','_redirects'])fs.copyFileSync(path.join(__dirname,file),path.join(out,file));
fs.cpSync(path.join(__dirname,'icons'),path.join(out,'icons'),{recursive:true});
fs.mkdirSync(path.join(out,'api'),{recursive:true});fs.writeFileSync(path.join(out,'api/config.json'),JSON.stringify({url,key}));
console.log('Built static app with public connection settings.');

