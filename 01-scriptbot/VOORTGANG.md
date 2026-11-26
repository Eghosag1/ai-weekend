# Voortgang 01-scriptbot

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan. Het logboek van het vorige ontwerp
(sessies 3-6, 21/11) staat in de git-geschiedenis (commit `3df99f5`).

## Status
Alle stappen (1-6) gebouwd en live (24/11): portaal, plugin 1.0.6 (openbaar), 57 oude scripts als eerder gebruikt,
elk account van Client Check lid van het portaal (migratie 20261124160000). Open: de test in een nieuwe chat (Gini,
Eghosa) en de open vragen hieronder.

## Logboek
- 2026-11-24: Gini kreeg "geen lid van het portaal" (ingelogd met office@). Eghosa: iedereen van Client Check is meteen
  lid. Migratie 20261124160000 (revenuelab-portaal 5e0cfb9): is_lid() = portaal.leden of een rol in public.user_roles;
  de 6 accounts zonder lid-rij erbij als 'lid'. Lokaal 1276 tests groen. Live: `live/20261124160000_live.sql` (Eghosa).
- 2026-11-24: stap 5. Videobot (video-agent): `tools/portaal.py montageplan --code <KODE> --nr <n> <videomap>` haalt
  een door de klant goedgekeurd script (portaal-bot, actie `scripts`) en schrijft 01_SCRIPT.md (vorm van het sjabloon:
  outputvarianten, hooks met visuele hook, body/einde met per take filmen en montage, feiten) + 01_SCRIPT.json; nooit
  overschrijven (alleen het lege sjabloon). De opdrachtprompt van de werker noemt het. Oude scriptbot weg: skill
  `scriptbot`, `16_SCRIPTS.md`, `tools/scripts.py` + test, `config/scripts.json`, `templates/klant/scriptbriefing.json`,
  taaksoort `scripts` in de werker (stond nooit live in het portaal). 387 tests videobot groen (commit ad1aeb79). BOT-API bijgewerkt (f169542).
- 2026-11-23: na elke oplevering vraagt de bot zelf om akkoord; "akkoord" = in het portaal + meteen de scriptlink +
  uitleg wat volgt (Eghosa; plugin 1.0.5). Stap 4: 84 oude 01_SCRIPT.md uit video-agent woordelijk omgezet (subagents;
  waar 01_SCRIPT een leeg sjabloon of verwijzing was: het bronscript in `assets/scripts/` of de transcriptie). 27 zonder
  spraak (aftermovies, beursreels, socials) overgeslagen, 57 gesproken scripts bij 14 klanten. Niet ingeladen: DPG (niet
  in Client Check), Revenue Lab (intern), testmappen. ABBI hoort bij "Floors and More ABBI". Per script
  `klantakkoord` (uit 03_STATUS.md). Generator `scripts/scripts_eerder_gebruikt.py` (commit 0858a25), idempotent op
  klant + bron, lokaal twee keer getest. De oude scripts krijgen de eerste nummers; nieuwe scripts nummeren verder
  (S9 enz.). Plugin 1.0.6: vertrek vooral van de eerder gebruikte scripts met klantakkoord.
- 2026-11-23: Eghosa vond de eerste testscripts te generiek ("Ik ben Dries. Ons bedrijf bestaat sinds 2012…"). Analyse
  van ±55 eigen spreekscripts (±20 goedgekeurd) → stijlgids `references/stijl.md` in de plugin (soorten scripts met
  aandeel, hooks met voorbeelden, toon, wat niet voorkomt, lengte ±95-125 woorden, 15 schrijfregels; geanonimiseerd).
  De skill leest ze vóór het schrijven, kiest bij 3 scripts drie soorten en vertrekt van de vorige scripts van de klant.
  Plugin 1.0.4. Idee voor later: een tool in portaal-mcp met goedgekeurde voorbeeldscripts van andere klanten (privé).
- 2026-11-23: eerste test in de chat (Dries Test): geen feiten verzonnen, vragen gesteld, feitencheck en invalshoeken
  zoals bedoeld. Aanpassing: altijd 3 scripts × 2 hooks (was: alleen bij de kick-off), plugin 1.0.3.
- 2026-11-23 (sessie 7, vervolg): Hermann lid gemaakt (Eghosa draaide `live/lid_hermann.sql`). Plugin op deze laptop
  geïnstalleerd en ingelogd bij beide koppelingen; leesproef: het portaal vindt Dries Test (0 scripts), `search_clients`
  van Client Check vindt hem niet (toont niet elke klant) → skill 1.0.1 valt terug op `get_client_overview` of het
  portaal. Installatieprompt in de README. Hermann en Gini zitten niet in de GitHub-organisatie → Eghosa koos de repo
  openbaar te maken; eerst klantnaam (voorbeeld) en voornamen vervangen door een verzonnen naam en rollen (1.0.2), daarna
  door Eghosa: geschiedenis tot één commit en openbaar (mijn poging daartoe werd terecht tegengehouden).
- 2026-11-22 (sessie 7, stap 3): plugin `Red-Pepper-Antwerp/scriptbot` (privé): `skills/scriptbot/SKILL.md` (aanvraag,
  feitencheck vers uit Client Check, bestaande scripts, invalshoeken, script met takes, akkoord → `script_zetten`,
  scriptlink, opmerkingen verwerken; regels), `references/scriptformaat.md` (uit `SCRIPTFORMAAT.md`), `.mcp.json`
  (`client-check` = copilot-mcp, `revenuelab-portaal` = portaal-mcp, beide OAuth), marketplace `revenuelab`.
  `claude plugin validate` geslaagd (alleen waarschuwingen voor de openbare catalogus: icoon, privacybeleid). Geladen
  met `--plugin-dir`: beide koppelingen vragen om in te loggen (de OAuth-ontdekking werkt). Niet getest: inloggen en een
  volledig script (interactief, door Eghosa). Hermann: het portaal heeft geen scherm voor leden (README: "een lid komt
  erbij met een script"); `live/lid_hermann.sql` gemaakt (rol lid, twee keer draaien = niets dubbel).
- 2026-11-22 (sessie 7, live): het ontwerp van 21/11 bleek wél live te staan (in de notities stond van niet). Het nieuwe
  live-script weigerde daarom (één transactie, niets veranderd). Oud terugdraaiscript gemaakt
  (`live/20261121200000_oud_terug.sql`), lokaal getest (oud eraf, nieuw erop, tests groen) en nagekeken tegen live (alleen
  lezen). Eghosa draaide: oud terug, nieuw live, functies, app. Weg: de proef van de nacht bij EVM dakwerken (1 ronde, 3
  scripts, 18 klantfeiten). Nagekeken (alleen lezen): schema op 20261121200000, nieuwe tabellen en 8 functies, 4 regels,
  geen oude tabellen; portaal-mcp geeft zonder login 401 met de juiste plek om in te loggen, portaal-klant 404 bij een
  onbekende link, portaal-bot 401 zonder sleutel.
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
  `Red-Pepper-Antwerp/scriptbot`, openbaar (23/11). Aan het einde een standaardprompt die alles voor hen instelt.
- Werkkopie portaal: `~/Desktop/revenuelab-portaal`.
- Scriptlink per klant (los van de klantlink per campagne); wie het script maakte stuurt hem zelf door, niet Romina.
- Geen koppeling met campagnes en geen "naar productie": de videobot vraagt het script op per klant en nummer.
- Opmerkingen van de klant per script, eventueel bij een zin.
- Bouwvolgorde goedgekeurd; beginnen met stap 1.
- Alles gebeurt in de chat van Claude Code; het portaal is alleen voor de klant (23/11).
- Altijd 3 scripts met elk 2 hooks, tenzij anders gevraagd (23/11; plugin 1.0.3).
- Klant ziet alleen de tekst; richtduur ±35 s, langer of korter op vraag in de aanvraag.
- De ±89 oude scripts eenmalig in het portaal als "eerder gebruikt", onzichtbaar voor de klant.

## Open vragen
- Melding voor het team bij opmerkingen of akkoord van de klant (Slack, "Wacht op jou" in het portaal, of later): Eghosa
  denkt erover na.
- Wie verwerkt de opmerkingen van de klant: dezelfde persoon die het script aanvroeg?
- Scriptformaat §7: lijst "wat de videobot altijd zelf doet" en `overlay` houden (Eghosa kijkt na).
- Testen op Dries Test vraagt testgesprekken in Client Check (die heeft er 0). Zet Eghosa die erin, of testen we op een
  echte klant met alleen lezen en zonder iets naar het portaal te sturen?

### 24/11: 1.1.0, alleen tekst
- Eghosa: "voor nu alleen scripts geven en checken of we ze al gebruikt hebben". De bot schrijft geen filmen, montage,
  visuele hook of shootlijst meer: alleen titel, 2 hooks en takes.
- Vast in elk script: "bereken het in 2 minuten" in één van de 2 hooks; de calculatorbody vlak voor de CTA (letterlijk die
  van de klant uit een goedgekeurd script, anders de standaardtekst).
- Voor de oplevering: controleregel per script (nieuw tegenover alle scripts in het portaal, ook eerder gebruikt; 2 minuten;
  calculatorbody).
- Geparkeerd (Open vraag): edits per take (analyse 24/11 van 80 video's: alleen-spreker is 23% van de goedgekeurde takes).

### 26/11: 1.2.0, concrete filminstructies
- Eghosa wil toch filminstructies, maar concreet; b-roll toont wat er in die take gezegd wordt. Per hook en take één regel
  Filmen: spreker (plek + actie), spreker + beeld erachter, b-roll (één shot per gezegd ding, ±5 s), of niets
  (calculatorbody: schone audiotake). Shootlijst per plek terug; de bot vraagt weer waar er gefilmd wordt. Montage blijft weg.
