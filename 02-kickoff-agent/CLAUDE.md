# 02 Kick-off-agent

Lees eerst `../CLAUDE.md`.

## Doel
Zodra de opname van de onboardingcall binnen is, zet een agent binnen enkele uren alles klaar zodat de kick-off alleen nog ja of nee is.
Twee menselijke controlemomenten: Thibo (cijfers en scripts, 15 min) en de accountmanager (alles, de dag ervoor, 15 min).

## Bron in de briefing
Sectie "Kick-off prep (one agent, two human checkpoints)", stappen 1 tot 13, en "Short onboarding call: the questions" (23 vragen + 5 Strilio-vragen).
Owner: "building the kick-off prep agent (incl. the script bot and the Strilio setup via MCP): Eghosa".

## Wat al bestaat (ClientsCheck, tenzij anders vermeld)
- `supabase/functions/qwilr-webhook`: getekend voorstel maakt de klant aan.
- `supabase/functions/copilot-fireflies`: transcripties bij de klant, elk kwartier.
- `client_profiles`, `client_profile_contacts` + `supabase/functions/client-profile`: contacten per rol, concurrenten, updateritme. Mist: aanbod, USP's, regio, pipeline, KPI's, scope.
- Schema `onboarding` + `_shared/onboarding-*.ts` + `docs/onboarding/beslissingen.md` (DEC-01 tot DEC-73): dossier, stappen, klantpagina, herinneringen in Vandaag. Jouw eigen module.
- MCP-server `supabase/functions/copilot-mcp/tools.ts`: o.a. `get_client_overview`, `search_conversations`, `create_client`.
- Vault `red-pepper-connector-vault/supabase/functions/strilio-write`: `planAccountSetup` (droge run) en `applyAccountSetup` (tenant, team, DNS, telefonie) met goedkeuringszin.
- Strilio `src/services/workflows/standard-workflow-set.service.ts`: standaardflows als concept, idempotent. Bulkimport: `src/components/contacts/bulk-contact-import.ts`.
- Vault `google-run`: agenda lezen en schrijven.
- Benchmarks: zie 03 en `supabase/functions/market-trends-sync`.

## Wat je bouwt
- [ ] Klantbrein uitbreiden met de briefingvelden: aanbod en focus, uitsluitingen, prijsvork, promoties met einddatum, USP's, bezwaren, regio's + uitgesloten postcodes, verkopers (naam, gsm, mail, regio, capaciteit, vrije dagen), leadbronnen, CRM/ERP + admin, offertetool + voorbeeldofferte, mail/agenda-provider + wie goedkeurt, Strilio-scope, offertes in Strilio ja/nee, gebruikers + rollen, verkoopstappen, bestaande database, verkopen/maand, orderwaarde, afspraken per verkoop, doel, beslisser, aanspreekpunt, kick-offdeelnemers. Per veld de bron; onbekend blijft "onbekend".
- [ ] Vragenlijst onboardingcall (23 + 5), met "bekend uit Qwilr/Fireflies: alleen bevestigen". Geen wachtwoorden mondeling.
- [ ] Agent: transcriptie + Qwilr + website naar die velden. Trigger: Fireflies-opname van de onboardingcall hangt bij de klant.
- [ ] Ontbrekende velden als vraag in de toegangsmail (stap 3).
- [ ] Toegangslijst in de onboardingstappen aanvullen: Meta, Google Business, website + DNS, mailbox, WhatsApp, logo en foto's, Google Analytics, Search Console, leestoegang offertetool. Per toegang korte uitleg en wie het regelt.
- [ ] Koppelmomenten van 15 min (betaalkaart Meta, Microsoft-goedkeuring, 2FA) als agendavoorstel.
- [ ] Toegangsmail, statusmail halverwege en herinnering dag ervoor als soorten in de bestaande herinneringsmotor (geen tweede mailflow; DEC-53/61: max 1 per dag per dossier).
- [ ] Scriptbriefing klaarzetten voor 01.
- [ ] Strilio inrichten in hun eigen account: gebruikers en rollen, eigen pipeline, leadverdeling, opvolgflows, handtekening, logo, dashboard; bij offertes ook template + producten/prijzen uit de voorbeeldofferte. Idempotent. Geen demo-account met nep-leads.
- [ ] Oude database importeren, gescheiden van nieuwe leads, met toestemming en opt-out (voor 09 reactivatie).
- [ ] Offerteanalyse: een of twee observaties, niets verkopen.
- [ ] Branding-analyse starten (04).
- [ ] Datavoorstellen tegen de agenda's van Hermann en Eghosa: shoot, koppelmomenten, brandingmeeting (+1 week), CRM/go-live (week 3), eerste rapportering, strategiesessie maand 4.
- [ ] Kick-offdeck laten vullen (03).
- [ ] Controlemomenten voor Thibo en accountmanager als actie in Vandaag; afgekeurd = dezelfde dag terug.

## Klaar als
- Testklant "Dries Test" met een opgenomen call levert binnen enkele uren een volledige briefing; ontbrekende velden staan als vraag in de toegangsmail.
- Alle 23 + 5 vragen zitten in de vragenlijst of de briefing.
- De Strilio-testtenant heeft gebruikers, eigen pipeline, flows, handtekening; een tweede run maakt niets dubbel.
- Geen mail vertrekt zonder klik van een mens.

## Werk in
`ClientsCheck` (klantbrein, agent, onboarding), `red-pepper-connector-vault` (Strilio-inrichting), `sprout-lead-core-new` (alleen als Strilio iets mist; merge door Dries).

## Open vragen
- D4: Strilio-inrichting in de Vault of als beheertools in de Strilio-MCP?
- D5: standaardflows aanpassen (voicemail 2 en 4 naar WhatsApp, 5 laatste mail) of bestaande set (Voicemail 3 en 5)?
- Wie doet de onboardingcall? De briefing zegt het niet.
- Agendatoegang voor Hermann.
- Qwilr: bieden ze webhooks in het abonnement (DEC-38)?
