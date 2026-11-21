---
name: wrike-briefing
description: Gebruik deze skill telkens iemand van Red Pepper vraagt om iets in Wrike te zetten ("zet het in Wrike", "maak een taak", "plan dit in"). Claude zoekt eerst zelf de context (Fireflies, Client Check, mailbox, Wrike) en stelt daarna vragen tot de briefing zo helder is dat hij de taak zelf perfect kan uitvoeren. Pas dan wordt de Wrike-taak aangemaakt.
---

<!--
Afgeleid van: het concept van de nachtploeg (night-shift-thibo/dag/2026-11-21/briefing-skill/SKILL.md, 21/11),
uitgebreid volgens AI-Weekend/05-briefing-check/VOORTGANG.md ("Plan voor de skill") en de briefing van Wannes
(00-bronnen/briefing-wannes-2026-11-21.md, §13 Briefing check). Titelformaat: night-shift-thibo/regels/feedback.md (9/11).
Tools: ClientsCheck copilot-mcp (tools.ts) en red-pepper-connector-vault wrike-run (index.ts).
Status: CONCEPT. Huisregels: ../huisregels.md (Wannes keurt). Taaktypes: ../briefing-per-type.md.
-->

# Wrike-briefing

Doel: elke taak in Wrike is zo helder dat een collega of robot ze uitvoert zonder terug te vragen en zonder de
oorspronkelijke chat of mailbox. Geen aannames: wat je niet vindt, vraag je. Een vage vraag geeft vragen, nooit een taak.

## Werking

**1. Klant bepalen.** `search_clients` (Client Check) op de naam die de aanvrager noemt. Meerdere of geen treffer: vraag
welke klant. Klantcode: lees ze af uit de titels van bestaande Wrike-taken van die klant (`search_wrike_tasks`, bv.
`RENB`, `JANS`). Geen eenduidige code gevonden: vraag ze, verzin er geen.

**2. Zelf context zoeken, vóór je iets vraagt.**
- Client Check: `get_client_overview` (contactpersonen, contract, beloftes, laatste gesprekken, Wrike-stand),
  `search_conversations` (mail, WhatsApp, telefoon, meetings met samenvatting, Wrike-reacties), `search_commitments`
  (wie beloofde wat, tegen wanneer; dit is geen takenlijst), `get_conversation` (volledige mail of meetingtranscriptie).
- Fireflies en mailbox (Gmail): recente meetings en mails met de klant over dit onderwerp, als die koppeling er is.
- Wrike: `search_wrike_tasks` (Client Check) of `searchTasks` / `taskComments` (`wrike-run`), of de Wrike-connector in
  Claude (`search_items`, `get_item_comments`).

**3. Bestaande taak zoeken (idempotent).** `wrike-run createTask` controleert niet op dubbels, dus jij doet het.
Zoek open taken van dezelfde klant over hetzelfde onderwerp (titel en omschrijving). Vind je er een: maak geen nieuwe
taak, maar stel een reactie op die taak voor (tekst tonen, plaatsen na "ok", via `addComment`). Twijfel of het
hetzelfde is: toon de gevonden taak (titel, status, link) en vraag "aanvullen of nieuwe taak?".

**4. Vragen tot compleet.**
- Toon eerst kort wat je gevonden hebt, met bron: "Ik zie dat … (mail van 12/11), klopt dat?". De aanvrager stuurt bij.
- Max. 3 vragen per ronde, concreet en beantwoordbaar. Nooit vragen wat in de bronnen staat.
- Toets na elke ronde: **kan ik deze taak zelf uitvoeren zonder terug te vragen?** Loop daarvoor na: wat, voor welke
  klant, waarom, kanaal/tool, deadline, wie (eigenaar), bronnen en links, wat "klaar" betekent, wat niet mag.
- Geen vaste checklist per taaktype. Voor design, video en shoot staat in `../briefing-per-type.md` wat er in de
  praktijk vaak ontbreekt (exacte bron van de beelden, script en hooks, wie spreekt, ad of organisch met CTA en
  bestemming, website bij een nieuwe klant, shootadres en -datum, wie in beeld met toestemming). Gebruik het als geheugen,
  niet als formulier.
- Herhaal tot de toets "ja" geeft. Deadlines, prijzen en beloftes verzin je nooit.

**5. Tonen.** Toon de aanvrager in één bericht: map (klantmap en submap), titel, start- en einddatum, eigenaar en de
volledige beschrijving (formaat hieronder). Vraag: "Zo aanmaken? (ok)".

**6. Aanmaken na "ok".** Pas na een uitdrukkelijk "ok" van de aanvrager. Via `wrike-run createTask` (`folderId`, `title`,
`description`, `dates`, `responsibles`, eventueel `importance`); die schrijfactie vraagt de goedkeuringszin, die je
alleen meegeeft na dat "ok". Of via de Wrike-connector in Claude. Zoek vlak ervoor nog één keer naar een dubbel (stap 3).

**7. Teruglezen.** Lees de aangemaakte taak terug (`taskDetails` of de connector): staat ze in de juiste map, kloppen
titel, datums, eigenaar en beschrijving? Geef de aanvrager de link. Klopt iets niet: zeg het en stel de correctie voor.

## Titel

`NN | KLANTCODE omschrijving` (nachtploeg, `feedback.md` 9/11). Omschrijving kort en concreet (bv. "2 video's
zonnepanelen najaar"). **Open: wat NN betekent is nog niet bekend** (gevraagd aan Thibo). Tot dan: neem NN over zoals
bestaande taken van dezelfde klant of soort het gebruiken, en vraag het als je het niet kunt afleiden.

## Beschrijving: vaste blokken

```
Wat: wat er gemaakt of gedaan wordt, met aantallen en formaat.
Waarom: het doel en de aanleiding.
Context: wat de uitvoerder moet weten, met citaten. Per citaat: "…" (bron, datum), bv. (mail klant, 14/11) of (Fireflies kick-off, 18/11).
Bronnen en links: footage, script, Drive-map, website, eerdere taken, gesprekken (met link of ID).
Klaar als: toetsbaar resultaat, bv. "2 video's in story, opgeladen in het portaal ter review".
Mag niet: bv. niets rechtstreeks naar de klant; geen prijs of belofte zonder akkoord; niet buiten deze briefing werken.
Huisregels die gelden: alleen de nummers en de korte tekst uit huisregels.md die voor deze taak gelden.
Eigenaar en deadline: wie, tegen wanneer.
```

Wat onbekend blijft, staat niet in de taak als feit: dan is de briefing niet compleet (terug naar stap 4).

## Huisregels

De kwaliteitslat staat in `../huisregels.md` (concept, Wannes keurt). Kort: Floors & More is de lat; in video's spreekt
altijd een persoon; huisstijl van de website van de klant; eerst echte beelden van de klant, nooit stock; niets
rechtstreeks naar de klant; geen verzonnen feiten en prijzen als "vanaf"; per-leadklanten nooit kosten tonen;
vaste regels voor leadformulier en calculator; blijf binnen de briefing. Zet in de taak alleen de regels die gelden.

## Nooit

- Een taak aanmaken met een onduidelijke briefing, of zonder "ok" van de aanvrager.
- Een tweede taak aanmaken over hetzelfde terwijl er een open taak bestaat.
- Vragen stellen waarvan het antwoord in Fireflies, Client Check, mail of Wrike staat.
- Deadlines, prijzen, klantcodes of feiten verzinnen.
- Iets rechtstreeks naar de klant sturen of als opdracht in de taak zetten. Klantmails verstuurt alleen Romina, in naam
  van Wannes: dat wordt een Wrike-reactie die begint met "@Romina (cc @Wannes)" en dan meteen de mail (onderwerp en tekst)
  (nachtploeg Z3, `feedback.md` 18/11 en 19/11).
- Sleutels, wachtwoorden of toegangen in een taak of reactie zetten.
