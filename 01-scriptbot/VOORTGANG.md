# Voortgang 01-scriptbot

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan. Het logboek van het vorige ontwerp
(sessies 3-6, 21/11) staat in de git-geschiedenis (commit `3df99f5`).

## Status
Bouwvolgorde goedgekeurd (22/11). Stap 1 (scriptformaat en woordenlijst montage) uitgeschreven in `SCRIPTFORMAAT.md`;
wacht op het nakijken door Eghosa (vragen in §7 daar). Daarna stap 2 (portaal).

## Logboek
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
- Bouwvolgorde goedgekeurd; beginnen met stap 1.
- De ±89 oude scripts eenmalig in het portaal als "eerder gebruikt", onzichtbaar voor de klant.

## Open vragen
- Melding voor het team bij opmerkingen of akkoord van de klant (Slack, "Wacht op jou" in het portaal, of later): Eghosa
  denkt erover na.
- Scriptformaat en woordenlijst montage: vragen in `SCRIPTFORMAAT.md` §7.
- Wie verwerkt de opmerkingen van de klant: dezelfde persoon die het script aanvroeg?
- Testen op Dries Test vraagt testgesprekken in Client Check (die heeft er 0). Zet Eghosa die erin, of testen we op een
  echte klant met alleen lezen en zonder iets naar het portaal te sturen?
