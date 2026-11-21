# Afspraken met Thibo (taak 12 en 15)

Volgens de nieuwste briefing is Thibo eigenaar van taak 12 (performance agent, eerste-lead-ping, 24-uursregel) en taak 15
(website check). De bouwspecificatie zegt bij taak 12: "Thibo: eerste-lead-ping en reminderimplementatie. Eghosa: bouwownership en integratie."
Dit bestand houdt bij wat jullie van elkaar nodig hebben. Geen bouwmap: als blijkt dat jij (een deel) bouwt, maak dan een map `12-performance` of `15-website-check`.

## Afspraken van 21/11 (bericht van Thibo)
- De cloud-Claude van Thibo pakt elke Wrike-taak op die op zijn naam staat. Daarom stonden de AI Weekend-taken op Nakijken met een concept.
- 11 (branding) en 17 (shootplanning): volledig Eghosa. Thibo haalt zich eraf in Wrike. Eghosa vraagt hetzelfde voor 10 en 14.
- 13 (briefing check): samen. Eghosa analyseert design-, video- en shoottaken, Thibo marketing-, ads- en funneltaken; daarna vult Wannes de huisregels aan en installeren ze de skill voor het team.
- 17 haakt later in op de performance agent (12) van Thibo: per klant rood/oranje + reden.
- 12, 15 en 16: beslissing bij Thibo (in het antwoord van Eghosa voorgesteld dat Thibo 12 en 15 verder bouwt).

## Eerst afspreken
- [ ] Wie bouwt de dagelijkse lijst van de performance agent: Thibo (bv. in `night-shift-thibo`) of Eghosa (in `ClientsCheck`)?
- [ ] Wie bouwt de 24-uursregel? Jouw PA-agent (`09-taak10-agents`) gebruikt dezelfde instellingen per klant. Een plek, niet twee.
- [ ] Wie bouwt de website check en het promotieregister (einddatum per actie in Client Check)?

## Wat jij van Thibo nodig hebt
- Een signaal per klant "rood of oranje, deze beelden nodig" (voor `08-shoots-hermann`).
- De kleur per klant uit de performancelijst (voor de retentiecheck in `09`).
- Rode punten uit de website check (voor de sitrep in `09`).
- Controle van cijfers en scripts in de kick-off-voorbereiding (15 min, `02`).
- Inhoud van maand 2, maand 3 en de strategiesessie (`10`).

## Wat Thibo van jou krijgt
- Reminderinstellingen per klant in het klantbrein (norm, dagen, ontvangers, maximum).
- Promoties met einddatum uit de intake (`02`).
- Concepten voor de meetings (`10`).

## Wat al bestaat bij Thibo
- `night-shift-thibo`: Z-regels (Meta-budget max één wijziging per campagne per dag van max +20%, plafonds in `regels/budgetten.md`;
  `takenwacht/modus.txt` = `LIVE Z2 Z10 Z11` op 21/11, dus Z4 staat uit; fase 2 vanaf 30/11), weekrapporten in Client Check.
- Taak 15 bestaat al: routine `routines/website-content-check.md` + `websitecheck/` (gemerged 21/11; elke maandag, testfase Batisol;
  Wrike-weektaak onder AI Checks → Website & content check). Ze schrijft naar `website_check_findings` en `gbp_review_snapshots`, die
  niet in de migraties van ClientsCheck staan (nog te maken of buiten git aangemaakt; let op DEC-G7).
- Taak 12: ontwerp `dag/2026-11-21/ontwerp-performance-agent.md` (alleen lezen/rapporteren).
- In ClientsCheck: `copilot-signals`, `copilot-escalations`, `campaign-spend-alerts` (in de code dagelijks om 9 u ingepland, migratie
  `20260715090000_…`; of de job live actief is, niet gecontroleerd), MCP `get_delivery_status`, `get_ad_report`.
