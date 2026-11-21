# 08 Shoots Hermann (taak 17)

Lees eerst `../CLAUDE.md`.

## Doel
Een contentmap per klant (welke video's er zijn en welke ontbreken, voor ads en social, per funnelstap) en een planner die op
Hermann's vrije dagen een route voorstelt langs klanten die dicht bij elkaar liggen, met per stop wat er nog gefilmd moet worden.

## Bron in de briefing
Sectie "17 · Hermann's shoots": funnelvideo's per klant (Renov is een voorbeeld, geen vast format), contentmap, prioriteit
(1: klanten met brandingpakket, verplicht; 2: klanten met zwakke resultaten via de performance agent), route op vrije dagen.
De oude Wrike-taak "15 | Shoot-planning agent" valt hierin.

## Wat al bestaat
- `video-agent/VIDEO AGENT/Video Projecten/<klant>/`: per klant de video's, scripts, status en beeldbank (25 klanten).
- Client Check: campagnes en ads per klant; adressen deels in Client Check en Strilio.
- Geen contentmap, geen routeplanner.

## Wat je bouwt
- [ ] Contentmap per klant uit de videobotmappen + lopende ads: per funnelstap en kanaal wat er is en wat ontbreekt.
- [ ] Prioriteit 1: brandingpakket. Prioriteit 2: klanten die de performance agent rood of oranje zet, met de beelden die nodig zijn.
- [ ] Vrije dagen uit de agenda van Hermann.
- [ ] Route op locatie, met opnamelijst per stop (alleen echt ontbrekende beelden, geen algemene B-roll).
- [ ] Terugschrijven: agenda, klantbrein, Wrike-taak (via 05).

## Klaar als
Op een voorbeelddag met drie klanten stelt de planner een logische volgorde voor met een opnamelijst van alleen ontbrekende beelden;
de klant met pakket staat erin.

## Werk in
`video-agent` (contentmap) en `ClientsCheck` (planner, klantbrein).

## Open vragen
- Welke route- of afstandsdienst? Adressen van de werven: waar staan die betrouwbaar?
- Agendatoegang voor Hermann.
- Signaal van taak 12 (zie `../_thibo/AFSPRAKEN.md`).
