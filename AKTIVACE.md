# Aktivace a ověření společného prostoru

Hotovo: projekt Supabase cenove-nabidky v organizaci TomasFNK (Frankfurt), databázová migrace, povolený účet tomas.fnk@gmail.com, napojení Vercelu na veřejný klíč a adresu projektu. Google provider je aktivní. Dne 30. 10. 2026 prošlo skutečné přihlášení povoleným Google účtem, zápis nabídky na server a načtení stejných údajů ve druhé záložce.

Ověřeno také: výchozí doprava 45 Kč/l, 6 l/100 km a rezerva 40 %; pro 240 km cena 907,20 Kč. Všechny kategorie procesů jsou při prvním otevření rozbalené. Klientský náhled má bílé pozadí a černý text. Klientské testy výpočtů, snapshotů, sbalení, obnovy a konfliktů prošly. Databázový test konfliktu a zamítnutí nepovoleného uživatele proběhl v transakci a byl vrácen zpět. Anonymní HTTP požadavek vrací 401.

Samostatné fyzické telefony a export výsledného PDF přes systémový tisk zatím ověřeny nebyly. Test dvou záložek ověřuje serverové ukládání a načtení, nikoli chování dvou oddělených zařízení.

## Google OAuth

1. V Google Cloud Console otevřete/vytvořte projekt pro tuto aplikaci. V Google Auth Platform nastavte název aplikace Cenové nabídky a kontaktní údaje. Při režimu Testing přidejte testovacího uživatele tomas.fnk@gmail.com.
2. Vytvořte OAuth Client ID typu Web application. Přidejte přesnou autorizovanou redirect URI:

   `https://jxohjcdqeslcdsiijdxg.supabase.co/auth/v1/callback`

3. Client ID a Client secret vložte přímo do Supabase → projekt cenove-nabidky → Authentication → Sign In / Providers → Google. Zapněte Google a uložte. Secret neposílejte do chatu, GitHubu ani klientského kódu.
4. V Supabase Authentication → URL Configuration nastavte Site URL:

   `https://cenove-nabidky-tomas-fnk.vercel.app/`

   Do Redirect URLs přidejte tuto adresu a přesný aktuální náhled pro test. Stálá adresa větve je:

   `https://cenove-nabidky-git-modern-shared-workspace-tomas-fnk.vercel.app/`

5. Přihlášení povoleným účtem a sdílená data jsou ověřené. Při přidání druhého účtu jej doplňte do databázového seznamu členů a při režimu Google Testing také mezi testovací uživatele. Účet hello@dominikbednar.com zatím přidaný není.

Při testu přes preview používejte přesnou povolenou adresu větve. Google klient potřebuje pouze běžnou identitu (openid, email, profile), žádný přístup k Gmailu nebo Disku.

## Kontrola databáze

Advisory hlášení RLS Enabled No Policy a Signed-In Users Can Execute SECURITY DEFINER Function odpovídají zvolené architektuře: tabulky nemají klientská oprávnění a přístup je pouze přes dvě funkce, které vždy ověří přihlášeného člena. Funkce mají prázdný search_path a explicitní názvy schémat; pomocná funkce není klientovi dostupná. Neodstraňovat tyto kontroly jen kvůli hlášení linteru.

https://supabase.com/docs/guides/database/database-linter?lint=0008_rls_enabled_no_policy
https://supabase.com/docs/guides/database/database-linter?lint=0029_authenticated_security_definer_function_executable