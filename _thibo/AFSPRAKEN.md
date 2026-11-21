# Afspraken met Thibo (taak 12 en 15)

Volgens de nieuwste briefing is Thibo eigenaar van taak 12 (performance agent, eerste-lead-ping, 24-uursregel) en taak 15
(website check). De bouwspecificatie zegt bij taak 12: "Thibo: eerste-lead-ping en reminderimplementatie. Eghosa: bouwownership en integratie."
Dit bestand houdt bij wat jullie van elkaar nodig hebben. Geen bouwmap: als blijkt dat jij (een deel) bouwt, maak dan een map `12-performance` of `15-website-check`.

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
- `night-shift-thibo`: Z-regels (Meta-budget max +20% per dag, plafonds in `regels/budgetten.md`, Z4 uit tot 30/11), weekrapporten in Client Check.
- In ClientsCheck: `copilot-signals`, `copilot-escalations`, `campaign-spend-alerts` (geen geplande run gevonden), MCP `get_delivery_status`, `get_ad_report`.
