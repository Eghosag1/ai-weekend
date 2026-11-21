# 01 Scriptbot

Lees eerst `../CLAUDE.md`. Analyse en beslissingen: dit bestand en `VOORTGANG.md`. Eerste versie van de skill (sessie 3,
21/11): git-geschiedenis, commit `4cef105`, map `01-scriptbot/skill/`.

## Doel
Voor elke nieuwe klant de advertentiescripts voor de kick-off voorbereiden: 3 scripts met elk 2 hooks, gepersonaliseerd
met hun aanbod, werf, prijs en promotie, met per script de vlag "klant acteert" of "acteur nodig". Niets verzonnen: elk
feit heeft een bron. Iemand van het team kijkt na (±15 min), de klant keurt goed of past aan in de kick-off, daarna gaan de scripts
naar de shoot van Hermann en de montage van de videobot, zonder iets over te typen. Daarna kan het team altijd nieuwe
scripts laten schrijven (promotie, invalshoek, meer hooks): elke aanvraag is een **scriptronde**.

## Bron in de briefing
- Kick-off prep stap 5: "the script bot writes them from the briefing, personalised with their site, price and promotion,
  and flags whether the client acts or we need an actor."
- Stap 11: Thibo checkt de berekening en de scripts (±15 min); de accountmanager de dag ervoor.
- Kick-offdeck deel 3: de scripts een per dia, goedgekeurd of aangepast ter plaatse; de shoot (locatie, wie, datum).
- Onboardingcall: vragen 1 tot 10 (`../00-bronnen/briefing-wannes-2026-11-21.md`, *Short onboarding call*).

## Architectuur (beslist 21/11, Eghosa: "akkoord")

Geen nieuwe app. Elk systeem doet wat het al doet:

| Systeem | Rol |
| --- | --- |
| Client Check | **De klantfeiten** (aanbod, uitsluitingen, prijs, promotie + einddatum, USP's, bezwaren, werf, wie in beeld, regio), per veld `voorstel` → `bevestigd`. Een bevestigd veld wordt nooit overschreven. Plus de Fireflies-transcripties. |
| video-agent | **De scriptbot**: skill `scriptbot`, `16_SCRIPTS.md`, `tools/scripts.py`. Scriptbriefing en scriptversies in de klantmap. Later ook de montage op die scripts. |
| Portaal | **Scripts per klant** op de klantpagina (tab Scripts, per ronde; niet in een campagne, beslist 21/11 avond), met versies, rechtstreeks aanpassen, feedback, nakijken (iedereen van het team), klantakkoord per ronde en koppeling per script aan campagnes. Aanvragen via *Nieuwe opdracht → Scripts*; de werker schrijft ze. *Naar productie*: video-ad-opdracht, status `wacht_op_footage`. |
| Wrike | Taak "scripts nakijken" voor Thibo, shoottaak voor Hermann (via de Vault `wrike-run`, met de goedkeuringszin). |
| Kick-off-agent | Roept de scriptbot op zodra de feiten compleet genoeg zijn (nog niet gebouwd). |

**Waarom in video-agent:** de bot praat al met het portaal (`tools/portaal.py` via `portaal-bot`), het scriptformaat
(`templates/video_project/01_SCRIPT.md`), de lat (`BRIEFING.md`) en de tekstcontrole (`tools/teksten.py`) staan daar,
en dezelfde bot monteert later op die scripts.

**Hoe de klantfeiten gevuld worden:**

| Bron | Wat | Status |
| --- | --- | --- |
| Onboardingtool van Eghosa (klant vult in) | prijzen, postcodes | `bevestigd` |
| Fireflies-transcriptie van de onboardingcall (Wannes) | aanbod, niet verkopen, USP's, bezwaren, promotie + einddatum, werf, wie in beeld, shootdata | `voorstel` (met tijdcode) |
| Website | diensten, formuleringen, bewijs | `voorstel` (met URL) |
| Schatting van de bot (alleen prijs, alleen als de klant geen prijs gaf) | een realistische "vanaf"-prijs | `schatting`: Thibo bevestigt vóór de kick-off |

Wannes of Thibo bevestigt in Client Check. Wat na de call nog ontbreekt, wordt een vraag aan de klant.

**Van goedgekeurd script naar video (footage):** na de kick-off maakt de bot de video-ad-opdracht aan met de scripts,
footage via SD-kaart, status `wacht_op_footage` (bestaat). Hermann filmt met de shootlijst per script. De kaart gaat in de
opname-pc; op de opdrachtpagina kies je de clips (bewust met de hand, `video-agent/VIDEO AGENT/09_OPDRACHTEN.md` §5) en de
bot start. Bij te bouwen: een opdracht zonder clips kunnen aanmaken, en de koppeling script → opdracht.

## Bouwvolgorde

| Fase | Wat | Raakt |
| --- | --- | --- |
| 1 | Skill `scriptbot` + `16_SCRIPTS.md` + `tools/scripts.py` (start, nieuw, controle, md, video, lijst). Scriptbriefing als bestand in de klantmap (zelfde velden als de toekomstige tabel). Test op de anonieme testklant. | video-agent |
| 2 | Tabel klantfeiten in Client Check (voorstel/bevestigd) + MCP-leestool, als migratiescript dat Eghosa draait. De bot leest de transcriptie en stelt de feiten voor. | ClientsCheck (script), video-agent |
| 3 | Portaal: scriptrondes per klant (versies, feedback per script, rechtstreeks aanpassen, goedkeuring, koppelen aan campagnes); werkertaak `scripts`. Bot-API bijvoegen (eerst portaal, dan bot). | revenuelab-portaal, video-agent |
| 4 | Na goedkeuring: video-ad-opdracht zonder clips (`wacht_op_footage`) met de scripts; shootlijst voor Hermann; Wrike-taken. | revenuelab-portaal, video-agent, Vault |
| Later | Leerlus: goedgekeurde scripts en aanpassingen van Thibo als referenties, hook-tags en Meta-resultaten uit de Creative Optimizer (Client Check). | |

## Regels
- Elk feit (prijs, getal, promotie, belofte) verwijst naar een veld van de scriptbriefing. Geen veld = schrappen of vraag.
- Bedragen altijd met "ongeveer" of "vanaf". Promotie alleen met einddatum. Geen review, resultaat of garantie zonder bron.
- Een prijs met status `schatting` gaat nooit naar de klant zonder bevestiging van Thibo of het team.
- Versies worden nooit overschreven; een handmatige aanpassing wordt een nieuwe versie met herkomst `handmatig`, en de bot
  werkt altijd verder op de hoogste versie.
- Echte klantgegevens alleen in video-agent of Client Check, nooit in deze werkmap.

## Hangt samen met
Kick-off-agent (feiten, oproep), kick-offdeck (scripts per dia), branding agent (eigen plek, niet meer een gedeelde Opstart), shootplanning
Hermann, Wrike-taak 14 "Nieuwe klant in één opdracht" van de nachtploeg (vraagt ook de scriptbriefing: afstemmen met Thibo).
