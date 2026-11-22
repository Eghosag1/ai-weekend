# Voortgang 01-scriptbot

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan. Het logboek van het vorige ontwerp
(sessies 3-6, 21/11) staat in de git-geschiedenis (commit `3df99f5`).

## Status
Stap 1 klaar (`SCRIPTFORMAAT.md`). Stap 2 (portaal) gebouwd en lokaal getest, **nog niet live**: revenuelab-portaal
(`~/Desktop/revenuelab-portaal`) commits `776ece6` en `c54577b`. Volgende: Eghosa zet live (hieronder), dan stap 3 (plugin).

Live zetten (Eghosa, in `~/Desktop/revenuelab-portaal`, in deze volgorde):
1. `git pull`, dan `/usr/bin/python3 scripts/migratie_live.py 20261121200000` (maakt `live/20261121200000_live.sql` en
   `_terug.sql`; lokaal proefgedraaid: live → terug → live, tweede keer weigert).
2. `scripts/clientcheck.sh sql live/20261121200000_live.sql` (één transactie; stopt zelf als het portaal niet op
   20261120120000 staat). Terug: `_terug.sql`.
3. `scripts/clientcheck.sh functies` (portaal-bot, portaal-klant, portaal-export en de nieuwe portaal-mcp; controleert dat
   portaal-mcp zonder login 401 geeft).
4. `scripts/clientcheck.sh app`.
5. Hermann lid maken van het portaal (Beheer → Leden); Gini is al lid.

## Logboek
- 2026-11-22 (sessie 7, stap 2): portaal gebouwd in `~/Desktop/revenuelab-portaal`. Het scriptwerk van 21/11 (rondes,
  versies, klantfeiten, werkertaak, koppeling met campagnes; nooit live) teruggezet naar `46c7256` en vervangen:
  - Migratie `20261121200000` herschreven: `scripts` (per klant S1, S2; inhoud met regie; status wacht_op_klant →
    opmerkingen → goedgekeurd; herkomst bot of eerder_gebruikt; geen versies; goedgekeurd nooit vervangen; twee keer
    hetzelfde = één), `script_opmerkingen` (met citaat), `script_log`, `scriptlinks` (één per klant, `/s/<link>`).
  - Edge Function `portaal-mcp` (OAuth zoals `copilot-mcp`; tools scripts_van_klant, script_zetten,
    opmerkingen_van_klant, scriptlink). `portaal-klant`: scripts, script_goedkeuren, script_opmerking. `portaal-bot`:
    scripts (alleen lezen). `clientcheck.sh` rolt portaal-mcp mee uit.
  - App: klantpagina in tabs Campagnes · Scripts (scriptlink, per script opmerkingen, wat de klant ziet, regie per take,
    feiten); klantpagina `/s/<link>` (alleen tekst; goedkeuren of opmerking bij een zin). Klanten met alleen scripts staan
    in de lijst.
  - Getest: 51 nieuwe databasetests en de test voor niet-leden groen; alle databasetests groen behalve
    `feedback_bron` en `feedback_doorsturen` (faalden al op main). 61 app-tests, build. `portaal-mcp` lokaal met een
    echte login (alle tools, ook 401 zonder login). Schermcontrole `scripts/schermen_scripts.mjs` op 390 en 1440 px
    (de hele lus, geen fouten, geen regie bij de klant). Live-script proefgedraaid op Postgres 17 (niet 15).
  - Niet gelukt: de volledige `npm run schermen -- --acties` stopt bij de videospeler: het kijkkopieënscript vond op deze
    laptop geen opgeleverde video's (staat los van de scripts; de stappen ervoor liepen).
  - Niet getest: het inloggen bij `portaal-mcp` via de toestemmingspagina van Client Check (kan pas live;
    `content-mcp` in ClientsCheck werkt al zo).
- 2026-11-22 (sessie 7, vervolg): stap 1. Montageprofiel §1-§10b en het shotlijst-sjabloon gelezen. Vaststelling: zooms,
  overgangen, kleur, captions, geluid en eindkaart doet de videobot altijd zelf; het script beschrijft alleen inhoudelijke
  keuzes. `SCRIPTFORMAAT.md`: opbouw (kop, hooks met verplichte visuele hook, takes met tekst/filmen/montage, feiten),
  woordenlijst (`geen` standaard, `beeld`, `beeld_achter_spreker`, `opsomming`, `overlay`, `cta_module`, `vrij`), drie
  weergaven (chat, klant, team/videobot), shootlijst per plek, JSON, voorbeeld. Dries Test heeft 0 gesprekken in Client
  Check (alleen SELECT): het voorbeeld gebruikt verzonnen feiten, duidelijk gemarkeerd.
- 2026-11-22 (sessie 7): brainstorm met Eghosa over een nieuwe scriptbot. Gelezen: het vorige ontwerp, het scriptsjabloon en
  het montageprofiel van de videobot, de MCP van Client Check (OAuth per gebruiker; geen tabel met commerciële feiten:
  `client_facts` is persoonlijk), de koppeling van de videobot met het portaal (`portaal-bot`, eigen sleutel). Gevonden: de
  scriptcommits van het portaal (`74b0f8d` e.a.) staan op GitHub en in `~/Desktop/revenuelab-portaal`, niet in de kloon in
  `~/Developer` (die stond achter). Ontwerp en bouwvolgorde in `CLAUDE.md`; oude inhoud van deze map vervangen.

## Beslissingen (2026-11-22, Eghosa)
- Scripts maken gebeurt in Claude Code; starten in gewone taal, geen `/scriptbot <klant>`.
- Ook latere scripts, met rekening houden met de scripts die de klant al heeft.
- Per take: tekst, filmen, montage; een montagetoevoeging alleen als ze iets bijbrengt.
- Geen take-nummers inspreken door Hermann.
- Klantfeiten niet in het portaal: telkens uit de gesprekken in Client Check halen en dubbelchecken (nieuw, kloppend).
- Geen versies: goedgekeurd in de chat → finaal in het portaal, behalve als de klant opmerkingen heeft.
- Klant ziet alleen de tekst; kan goedkeuren en opmerkingen geven. De regie staat bij het script in het portaal,
  verborgen voor de klant.
- Gebruikers: Hermann en Gini (hebben een account in Client Check en toegang tot Claude Code). Plugin in een eigen repo
  `Red-Pepper-Antwerp/scriptbot`. Aan het einde een standaardprompt die alles voor hen instelt.
- Werkkopie portaal: `~/Desktop/revenuelab-portaal`.
- Scriptlink per klant (los van de klantlink per campagne); wie het script maakte stuurt hem zelf door, niet Romina.
- Geen koppeling met campagnes en geen "naar productie": de videobot vraagt het script op per klant en nummer.
- Opmerkingen van de klant per script, eventueel bij een zin.
- Bouwvolgorde goedgekeurd; beginnen met stap 1.
- Klant ziet alleen de tekst; richtduur ±35 s, langer of korter op vraag in de aanvraag.
- De ±89 oude scripts eenmalig in het portaal als "eerder gebruikt", onzichtbaar voor de klant.

## Open vragen
- Melding voor het team bij opmerkingen of akkoord van de klant (Slack, "Wacht op jou" in het portaal, of later): Eghosa
  denkt erover na.
- Wie verwerkt de opmerkingen van de klant: dezelfde persoon die het script aanvroeg?
- Scriptformaat §7: lijst "wat de videobot altijd zelf doet" en `overlay` houden (Eghosa kijkt na).
- Testen op Dries Test vraagt testgesprekken in Client Check (die heeft er 0). Zet Eghosa die erin, of testen we op een
  echte klant met alleen lezen en zonder iets naar het portaal te sturen?
