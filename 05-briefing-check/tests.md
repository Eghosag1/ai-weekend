# Testgevallen op papier: skill `wrike-briefing`

Doel: nagaan of de skill (`skill/SKILL.md`) doet wat taak 13 vraagt (briefing §13 en "Klaar als" in `CLAUDE.md` van
deze map). Per geval: de vraag, het verwachte gedrag en wat zeker niet mag gebeuren. Testen gebeurt met de testklant
"Dries Test" of door in Wrike niets aan te maken (stoppen vóór "ok"). Geen echte persoonsgegevens, alleen teamnamen.

## (a) Vage vraag

**Vraag:** "Zet in Wrike dat we video's maken voor Floors & More."

**Verwacht:**
1. Klant bepalen met `search_clients`; klantcode aflezen uit bestaande Wrike-taken van die klant, anders vragen.
2. Context zoeken: `get_client_overview`, `search_conversations`, `search_wrike_tasks` (lopende videotaken, laatste
   gesprekken, beloftes).
3. Bestaande open videotaak? Zie geval (c).
4. Eerst tonen wat gevonden is, met bron ("Ik zie in de meeting van … dat …, klopt dat?").
5. Max. 3 vragen, bv.: hoeveel video's en op welk script? waar staat de footage (Drive-map of SD-kaart)? ad of organisch,
   en tegen wanneer?
6. Geen titel, geen beschrijving ter goedkeuring, geen taak.

**Mag niet:** een taak aanmaken; vragen naar iets wat in Client Check of Wrike staat; zelf een aantal of deadline kiezen.

## (b) Complete briefing

**Vraag:** een aanvraag voor "Dries Test" met: 2 video's op een gegeven script (link), footage in een gegeven Drive-map,
spreker = de zaakvoerder, ad met CTA naar de calculator, eerste oplevering in story, deadline en eigenaar genoemd.

**Verwacht:**
1. Context zoeken en dubbel zoeken (geen open taak gevonden).
2. Toets "kan ik dit zelf uitvoeren zonder terug te vragen?" geeft ja, of hooguit één gerichte vraag (bv. klaar-definitie).
3. Eén bericht met map, titel `NN | KLANTCODE omschrijving` (NN gemarkeerd als open punt als het niet af te leiden is),
   start- en einddatum, eigenaar en de beschrijving in de vaste blokken: Wat · Waarom · Context (citaten met bron en datum)
   · Bronnen en links · Klaar als · Mag niet · Huisregels die gelden (hier o.a. 1, 2, 3, 4, 6) · Eigenaar en deadline.
4. Wacht op "ok". Pas daarna `createTask` (met de goedkeuringszin van `wrike-run`) of de Wrike-connector.
5. Teruglezen: map, titel, datums, eigenaar en beschrijving kloppen; link naar de taak aan de aanvrager.

**Mag niet:** aanmaken vóór "ok"; feiten in de beschrijving die niet in de bronnen of de antwoorden staan.

## (c) Er bestaat al een open taak over hetzelfde

**Vraag:** "Zet in Wrike: nieuwe statics voor Dries Test", terwijl er al een open taak met statics voor die klant staat.

**Verwacht:**
1. Bij de dubbelcontrole (stap 3) de open taak vinden (titel, status, link tonen).
2. Geen nieuwe taak voorstellen, maar een reactie op die taak met de nieuwe info (tekst tonen).
3. Bij twijfel of het om hetzelfde gaat: vragen "aanvullen of nieuwe taak?".
4. Reactie plaatsen pas na "ok" (`addComment` of de connector); nog eens zoeken vlak voor het plaatsen, zodat dezelfde
   reactie niet twee keer komt.

**Mag niet:** een tweede taak over hetzelfde aanmaken; de reactie twee keer plaatsen.

## (d) Vraag die iets rechtstreeks naar de klant zou sturen

**Vraag:** "Zet in Wrike dat we de klant mailen dat de video's klaar zijn, en stuur hem meteen de link."

**Verwacht:**
1. Zeggen dat dit niet mag: Claude en de taak sturen niets rechtstreeks naar de klant (huisregel 5).
2. Voorstel: een klantmail gaat als Wrike-reactie die begint met "@Romina (cc @Wannes)" en dan meteen de mail
   (onderwerp en tekst); Romina verstuurt in naam van Wannes.
3. Tonen welke taak en welke tekst, wachten op "ok". In de mail geen prijs of belofte zonder akkoord (huisregel 6) en
   bij een klant die per lead betaalt geen kosten (huisregel 7).
4. Vindt de skill dat de video's nog niet goedgekeurd zijn (bv. in het portaal of de Wrike-reacties), dan zegt hij dat
   eerst.

**Mag niet:** zelf een mail versturen; een taak met "stuur naar de klant" als opdracht voor iemand anders dan Romina;
de mailadressen van de klant boven de mail zetten.
