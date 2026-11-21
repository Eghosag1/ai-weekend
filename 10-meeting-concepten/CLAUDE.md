# 10 Meetingconcepten (klantreis)

Lees eerst `../CLAUDE.md`.

## Doel
Voor elk vast moment in de klantreis zet de agent op tijd een concept klaar in Vandaag (Client Check), in het formaat van de outlines uit
de briefing en volgens de 17 deckregels. De accountmanager brengt het verhaal, Thibo de cijfers (maand 2, 3 en de strategiesessie).

## Bron in de briefing
"The journey" en de outlines: CRM/go-live (5 dia's, rest live in Strilio), eerste rapportering (13), maand 2 (12, max 60 min:
15+15+15+5+5), maand 3 (9 dia's, Answered-pakketten + website), strategiesessie (14 in 3 blokken, ongeveer 2 u op kantoor),
"Between month 1 and 2", "Between month 2 and 3", "Between month 3 and 4", eerste resultatenmail na 5 dagen, wekelijkse update.

## Wat al bestaat (ClientsCheck)
- `reporting-calendar`: rapportagemeetings herkennen in de agenda (alleen lezen).
- MCP `get_ad_report`, `get_lead_report`, `get_follow_up_report`: de cijfers.
- `client_weekly_reports` + routine `night-shift-thibo/routines/clientcheck-rapporten.md`: weekrapport als concept (woensdag).
- `generate-report`, `generate-client-email`, `copilot-commitments` (afspraken uit meetings), opvolgmail na meeting in `copilot-morning`.

## Wat je bouwt
- [ ] Klantreis-kalender per klant in het klantbrein, met de datum van elk moment (startpunt: zie open vragen).
- [ ] Go-live: dynamische agenda (blok 1 tot 6 en 8, of met blok 7 offertes), checklist (webhooks, bronnen, iedereen ingelogd, testlead tot in de agenda), voorbeeld van een andere klant alleen geanonimiseerd of met toestemming.
- [ ] Eerste resultatenmail na 5 dagen (concept, eerlijk als het zwak is) en wekelijkse update, bovenop het bestaande weekrapport.
- [ ] Maand 1: eigen online campagnes tegen KPI's en benchmark; andere leveranciers alleen ter vergelijking; reactivatie apart; 2 tot 3 acties + budgetbesluit.
- [ ] Sales scan week 5 tot 8 + maand 2: herberekening met echte ratio's, 1 of 2 lekken, flows klaar in Strilio, tevredenheidsvraag; cijfers per verkoper eerst met de zaakvoerder; elke flow een meetpunt.
- [ ] Maand 3: 9 dia's op basis van de SEO/GEO-analyse (taak 15) en de nieuwe pagina's (04), prijs uit Qwilr.
- [ ] Weken 13 tot 16: 20 salesgesprekken voor Flincher (opnemen vanaf maand 2 tot 3, met toestemming), cohortdata eerlijk, demo's op eigen data.
- [ ] Strategiesessie: datum in de kick-off, roadmap met 2 tot 3 opties met prijs dezelfde week, vragen naar referrals.
- [ ] Persoonlijk bericht halverwege maand 1 en 2 als suggestie in Vandaag.

## Klaar als
- Voor een testklant staan alle momenten met datum in de kalender en verschijnt per moment op tijd een concept.
- De maand-1-rapportering scheidt eigen campagnes, externe leveranciers en reactivatie.

## Werk in
`ClientsCheck`. Templates samen met `../03-kickoff-deck`.

## Open vragen
- Strategiesessie elke 16 weken of elk kwartaal?
- Vanaf wanneer tellen de 120 dagen (verkoop, kick-off, go-live)?
- Prijzen maand 3 bevestigen (Answered v2 + website 6.000 tot 8.000, 50% korting 12 maanden).
- AI-belagent (maand 2): bestaat niet in Strilio; bouwen of niet?
