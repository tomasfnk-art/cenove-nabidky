# Nasazení aplikace

Aplikace používá statický web a Supabase pro Google přihlášení a sdílená data. Osobní údaje dodavatele a seznam členů patří do chráněné databáze, nikoli do veřejného klientského kódu. Každá nabídka uchovává vlastní kopii nastavení a dodavatele.

## Netlify

1. Nastavit v projektu veřejné proměnné SUPABASE_URL a SUPABASE_PUBLISHABLE_KEY. Nikdy nepoužívat service role nebo OAuth secret v klientském výstupu.
2. Spustit `node verify.cjs`, poté `node build.cjs`. Build přijímá pouze veřejný sb_publishable_ klíč.
3. Pro nasazení z Gitu použít netlify.toml. Pro ruční nasazení nahrát obsah dist jako ZIP. Ruční nahrání samo nezapíná automatické nasazování z GitHubu.
4. V Supabase nastavit přesnou hlavní adresu aplikace jako Site URL i povolenou Redirect URL. Google callback zůstává adresa Supabase Auth.
5. Ověřit Google přihlášení, sdílená data a přístupová pravidla. Veřejná přihlašovací stránka nesmí zpřístupnit nabídky nepovoleným účtům.

Build publikuje pouze aplikaci, manifest, ikony, veřejný config a HTTP pravidla. Dokumenty a databázové soubory do dist nepatří. `.netlify/`, dist, .env a místní provozní poznámky se necommitují.

## iPhone

Otevřít hlavní adresu v Safari → Sdílet → Přidat na plochu → případně zapnout Otevřít jako webovou aplikaci → Přidat. Z nové ikony se přihlásit vlastním povoleným Google účtem. Aplikace potřebuje internet, nepoužívá offline cache společných nabídek.

## DPH a ověření

Nové nabídky mají výchozí sazbu 21 % a zapnuté DPH. Checkbox „Dodavatel je plátce DPH“ umožní daň vypnout bez ztráty uložené sazby. Starší nabídky bez nového příznaku zachovají dosavadní výpočet. Testy ověřují zapnutí, vypnutí a opětovné zapnutí i klientský výstup bez daňových formulací u neplátce.

Bezplatné tarify mají limity a mohou službu po jejich dosažení nebo při delší neaktivitě pozastavit. Změnu tarifu a placené doplňky musí výslovně schválit vlastník.

