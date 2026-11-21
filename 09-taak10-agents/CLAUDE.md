# 09 De vier agents van taak 10

Lees eerst `../CLAUDE.md`.

## Doel
Vier agents die samen de klant volgen, elk met een eigen domein en zonder dubbele signalen:

1. **Opportunities agent**: wekelijkse sitrep per klant met kansen en een klaar concept per kans; Wannes keurt goed.
2. **PA-agent**: bewaakt alleen de opvolging door de klant (traag, lage afspraakratio, verloren leads), inclusief de herinneringen per klant.
3. **Database-reactivatie**: vaste flow in Strilio op oude leads, open/verloren offertes en vroegere klanten.
4. **Wekelijkse retentiecheck**: groen, oranje of rood per klant, met een concrete actie.

Een map omdat ze dezelfde data lezen en moeten afspreken wie welk signaal geeft.

## Bron in de briefing
"The four agents behind it" (opportunities, PA, reactivatie, retentiecheck met de tabel Inflow, Client follow-up, Conversion,
Campaign health, Relationship en de triggers), "24-hour rule", "Ongoing retention" (churnsignalen) en bij taak 12 de reminderinstellingen per klant.

## Wat al bestaat (ClientsCheck, tenzij anders vermeld)
- MCP `get_follow_up_report`, `get_daily_call_check`, `get_leads`, `get_ad_report`, `search_conversations`, `search_commitments`.
- `_shared/copilot-signals.ts`: dagelijkse signalen (o.a. opvolging trager dan 48 u, leads +50%, CPA -30%).
- `copilot-escalations`: pushmelding bij boze klant, stilgevallen ads.
- `src/lib/clientHealthOverview.ts`: klantstatus per week (goed, aandacht, risico, geen contact), nu handmatig.
- Strilio `agency-alert-runtime`: interne dagmail bij leads die niet opgevolgd zijn (`stale_after_hours`, standaard 72, per instelling aanpasbaar; of het werkuren zijn, is niet bevestigd).
- De nachtploeg pikte taak 10 op 21/11 op (verslag `night-shift-thibo/dag/2026-11-21/taak-4607254266.md`, alleen ontwerp); Thibo haalt zich eraf, Eghosa bouwt.
- Strilio workflowmotor (`src/services/workflows/`), trigger `opportunity_inactive_days`, mailvoorkeuren/afmelden, AI-opvolgbot, bulkimport, reviewverzoeken (`src/services/reputation`).
- Geen sitrep, geen reactivatieflow, geen 24-uursmail naar de klant.

## Wat je bouwt
**PA-agent en 24-uursregel**
- [ ] Reminderinstellingen per klant in het klantbrein: norm (24 of 48 u), dagen die tellen, wat als opvolging telt, ontvanger(s), kanaal, max per maand (standaard 3), toon.
- [ ] 24-uursregel: weekdagen, max 3 mails per maand in totaal, daarna patroon per verkoper, dag en bron in de weekupdate.
- [ ] Wijzigingsvoorstellen uit mails/Fireflies/telefonie ("mail mij, niet Jan"): voorstel, een klik goedkeuren, logboek. Nooit stil wijzigen.
- [ ] Signaal "bel de zaakvoerder" aan de accountmanager.

**Retentiecheck**
- [ ] Per klant en per bron, deze week tegen vorige week en het 4-wekengemiddelde: instroom, opvolging, conversie (vanaf week 8 ook offerte, deal, omzet, ROAS, open offertewaarde), campagnegezondheid, relatie.
- [ ] Triggers: leads -30%, CPA +30%, meer dan 20% niet opgevolgd, afspraakratio onder benchmark, 3 weken geen contact. Rood = actie, groen = videoreview of upsell.
- [ ] Vult de bestaande klantstatus automatisch in (geen nieuw scherm).

**Reactivatie (Strilio)**
- [ ] Triggers: offerte ouder dan 90 dagen, verloren op prijs/timing, no-show nooit herboekt, geimporteerde oude contacten.
- [ ] Dag 0 mail, dag 2 sms/WhatsApp, dag 7 laatste mail; stop bij antwoord, AI-bot neemt over.
- [ ] Max eens per 3 tot 4 maanden per lead; uit de database na 12 tot 18 maanden; opt-out; WhatsApp alleen met template + toestemming.
- [ ] Seizoenskalender per niche; hook per kwartaal ververst door de opportunities agent; resultaten apart voor de maand-1-rapportering.

**Opportunities**
- [ ] Klanttriggers (infosessie, beurs, nieuwe dienst, afgerond project, getekende offerte, vacature), vaste checks, buitenwereld (VEKA, VLAIO, Fluvius, VREG, CREG, Test Aankoop, Livios, Embuild, HLN), projectpijplijn (anoniem, foto's met toestemming).
- [ ] Sitrep per klant met concept per kans; leadgen en betaalde branding gescheiden; rode punten van de website check en ideeen uit 07 erin.
- [ ] Doet niets met opvolging door de klant (dat is de PA-agent).

## Klaar als
- Een testlead die 24 werkuren blijft liggen geeft precies een herinnering; de 4e in een maand vertrekt niet.
- "Mail mij in plaats van Jan" geeft een voorstel, geen stille wijziging.
- Een testcontact (testnummer Thibo) krijgt precies drie reactivatieberichten, niets meer na een antwoord.
- Elke klant krijgt elke week een kleur met reden; geen dubbel signaal tussen de vier agents en taak 12.

## Werk in
`ClientsCheck` (PA, retentie, opportunities), `sprout-lead-core-new` (reactivatieflow; merge door Dries).

## Open vragen
- D1: mag de 24-uursmail automatisch naar de klant, of eerst als concept? (Nu verstuurt alleen Romina klantmails.)
- Een opvolgnorm per klant als enige bron; 48 u (signaal) en 72 werkuren (Strilio-alert) als afgeleide tellers?
- Privacygrondslag voor oude contacten in de reactivatie.
- De 24-uursregel is volgens de briefing van Thibo (taak 12): zie `../_thibo/AFSPRAKEN.md`.
