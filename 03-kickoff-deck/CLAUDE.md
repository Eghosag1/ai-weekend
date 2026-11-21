# 03 Kick-offdeck en decktemplates

Lees eerst `../CLAUDE.md`.

## Doel
Een vaste decktemplate voor de kick-off (15 tot 17 dia's) die de agent per klant vult, met een calculator van omzetdoel naar
advertentiebudget op drie niveaus (toppers, gemiddelde, achterblijvers). Elke dia eindigt met ja/nee of een datum.
Dezelfde 17 deckregels gelden voor alle Revenue Lab-decks; de templates van de andere meetings staan in 10.

## Bron in de briefing
- "How our meeting decks tell the story": 17 regels (dia 2 "Wat we gehoord hebben", cijfers live, probleem als keuze, een redenering per dia, mechanisme als schema, controleerbaar bewijs, iets doorstuurbaars, hun materiaal naast het onze, wat we niet beloven, week per week, scope, prijs gelijk aan Qwilr, bezwaardia's in reserve, upsell-idee, check-ins, een cijfer een definitie, korte kern 15 tot 20 dia's + bijlage).
- "Kick-off deck (outline)": opening 1, succes 3, campagne en scripts 3, Strilio 4 tot 5, leadbronnen 1, offertes 1, volgende stappen 2 tot 3.
- "Sector benchmarks": startwaarden en hoe ze dynamisch worden. Voorbeeld: 10 deals, 37 afspraken, 93 tot 112 leads, ongeveer 1,4 tot 3,4k budget.
- Owner: "still to build: the kick-off deck template".

## Wat al bestaat
- ClientsCheck `supabase/functions/market-trends-sync` + tabel `market_segment_monthly_benchmarks`: CPL per sector/platform/regio per maand, op Meta-leads. Geen kwartielen, geen CPA of dealratio.
- ClientsCheck MCP `get_ad_report`, `get_lead_report`: leads, afspraken, offertes, gewonnen per campagne en verkoper.
- `creative-spark-engine` (Onboarding OS, Lovable, stil sinds juli): kick-off-analyse als idee, niet uitbreiden.
- Geen decktemplate.

## Wat je bouwt
- [ ] Benchmarktabel per sector: CPL, lead naar afspraak, CPA, afspraak naar deal, kost per deal, omzet per maand; top 25%, gemiddelde, onderste 25%. Uitbreiding van `market-trends-sync`, geen nieuwe functie.
- [ ] Terugval op de startwaarden (33 tot 40%, 27%, 15 tot 30 euro, 80 tot 110k of 200 tot 250k) met zichtbare bron.
- [ ] Calculator: doel + orderwaarde naar deals, afspraken, leads, budget, op drie niveaus. Herbruikbaar in maand 2 met echte ratio's.
- [ ] Decktemplate kick-off volgens de outline en de 17 regels; vaste opening en 120-dagentijdlijn; de agent vult sectie 2 tot 6.
- [ ] Vaste lijst van cijfers en definities die alle decks gebruiken (regel 16).
- [ ] Prijs en voorwaarden altijd uit Qwilr (regel 12).

## Klaar als
- Het voorbeeld van 10 deals geeft 37 afspraken en 93 tot 112 leads.
- Een deck voor de testklant is in enkele minuten gevuld; elke dia eindigt met ja/nee of datum; geen technisch werk in de kick-off.

## Werk in
Benchmarks en calculator: `ClientsCheck`. Template: in deze map (`templates/`), tot beslist is in welke tool (Google Slides of een Slides-artifact).

## Open vragen
- In welke tool komt het deck?
- Het salesdeck (regel 16 noemt fouten erin) valt buiten de acht taken: wie past dat aan?
