---
name: scriptbot
description: Schrijft de videoscripts voor een nieuwe klant uit de scriptbriefing (standaard 3 scripts met elk 2 hooks), met per script het format, de spreektekst, tekst in beeld en de vlag klant acteert / acteur nodig / open, plus een dia-versie voor het kick-offdeck. Gebruik bij "schrijf de scripts voor <klant>", "scripts uit de scriptbriefing", "scriptbot voor <klant>" of als de kick-off-agent de scripts vraagt.
---

# Scriptbot

Doel: uit de scriptbriefing (onboardingcall + Qwilr + website) de scripts voor de kick-off schrijven, gepersonaliseerd met
hun werf, prijs en promotie, zodat de klant in de kick-off per script alleen ja of nee zegt (briefing Wannes, *Kick-off
prep* stap 5; deck deel 3 *Campaign and scripts*). Werk in het Nederlands.

**Kwaliteitslat:** de handgeschreven scripts in `video-agent/BRIEFING.md` (ABBI, Floors & More). Lees ze vóór je schrijft.

## 1. Invoer

| Bron | Waar | Verplicht |
| --- | --- | --- |
| Scriptbriefing | formaat `scriptbriefing-sjabloon.md` (naast dit bestand); later geleverd door 02-kickoff-agent | ja |
| Klantbrein | `video-agent/VIDEO AGENT/Video Projecten/<klant>/00_KLANTBREIN.md` (§1 basis, §5 opname, §6 woorden) | als het bestaat |
| Website | veld "website" in de scriptbriefing; alleen voor feiten die er letterlijk staan (met URL als bron) | ja (anders vraag) |

Geen scriptbriefing? Maak er eerst één met `scriptbriefing-sjabloon.md` en vul alleen in wat in een bron staat.

## 2. Werkwijze

1. Lees de scriptbriefing veld per veld. Noteer welke velden `onbekend` zijn.
2. Kies per script een format (§3) en de vlag (§5).
3. Schrijf per script 2 gesproken hooks (§4), de body, tekst in beeld en eindtekst.
4. Een script waarvan een nodig veld `onbekend` is: **niet invullen**. Zet format, beeld en de structuur klaar, en schrijf
   de open vraag (met het nummer van de onboardingvraag) op de plaats van de tekst.
5. Doe de controle (§6). Wat niet slaagt, gaat terug naar stap 3 of wordt een open vraag.
6. Lever op volgens §7 en zet de nakijkregel voor Thibo (§8).

## 3. Format per script

Formats uit `BRIEFING.md`: persoon in beeld, foto swipe, voice-over, before/after, reviews, behind the scenes,
vraag & antwoord, statement, snelle benefit, detail/sfeer. Standaardset van 3 (beslissing 21/11, 3 × 2 hooks):

| Script | Inhoud | Format (voorkeur) | Nodig uit de briefing |
| --- | --- | --- | --- |
| S1 | de werf en de prijs | persoon in beeld op de werf | v7 (wat, waar, prijs), v8 |
| S2 | waarom zij | voice-over op werfbeelden, foto swipe of statement | v5, (v7 voor beeld) |
| S3 | hun meest gestelde vraag of bezwaar | vraag & antwoord | v6 (vraag én antwoord) |

Regels:
- Drie verschillende formats. Minstens één script met de spreker in beeld (`00_BASIS.md` §1: spreker eerst).
- Beeld alleen met echt materiaal: werf, Drive, website van de klant; geen stock (`06_MONTAGEPROFIEL.md` §5).
  Before/after alleen als er een echte "voor" bestaat; reviews alleen met echte reviews (bron + link).
- Lopende promotie (v4) mét einddatum mag S1 of S2 kleuren; zonder einddatum: niet gebruiken, wel vragen.
- Alles uit v2 (niet promoten) komt in geen enkel script voor.

## 4. Hooks (2 per script)

- Bron: de echte vragen en bezwaren van hun klanten (v6) en de redenen waarom klanten hen kiezen (v5); bij S1 mag de
  prijsvraag van de werf (v7) de hook zijn. Deckregel 8: minstens 3 van de 6 hooks komen uit klantvragen (v6).
- Eén zin, in de woorden van de klant waar die gegeven zijn. H01 en H02 zijn twee openingen voor dezelfde body en
  hetzelfde einde (`templates/video_project/01_SCRIPT.md`).
- Per hook ook de visuele hook (`06_MONTAGEPROFIEL.md` §4.1, §4.4): kicker (begin van de hookzin), grote woorden met
  het woord waarop ze wisselen (één tegelijk), optioneel een regel eronder; samen ±10 woorden of minder.
- v5 en v6 `onbekend`: geen hooks verzinnen. Alleen S1 krijgt dan prijshooks; S2 en S3 blijven open.

## 5. Spreektekst en vlag

- 12 tot 15 seconden verticaal: **±30–38 gesproken woorden** inclusief de hook (zoals `BRIEFING.md`). Tel ze en zet het
  aantal bij het script. Korte zinnen, spreektaal, aanspreekvorm uit klantbrein §6 (onbekend: concept in "je" + vraag).
- Vlag per script, uit v8 (wie voor de camera wil staan):
  - `klant acteert`: v8 noemt de eigenaar, een medewerker of een klant die wil getuigen (met naam);
  - `acteur nodig`: v8 zegt dat niemand van hen in beeld wil;
  - `open (v8)`: v8 is `onbekend`.
  Een voice-over heeft ook een stem nodig: de vlag geldt dan voor de stem.

## 6. Controle vóór oplevering

Loop elk script na; elk punt is ja of het script gaat niet mee.
1. **Elk feit verwijst naar een briefingveld** (zet het veldnummer erachter, bv. `[v7]`). Geen veld = schrappen.
2. **Bedragen** altijd met "ongeveer" of "vanaf" in dezelfde zin (`10_ADVERTENTIETEKSTEN.md` §2.3); nooit afronden of
   herrekenen. Btw of premies inbegrepen: alleen zeggen als de briefing het zegt.
3. **Promotie** alleen met einddatum uit v4.
4. **Geen review, resultaat, garantie of cijfer** (besparing, terugverdientijd, aantal installaties) zonder bron.
   Niets beloven wat niet in de briefing staat; geen "100%" (deckregel 9; verboden woorden in
   `video-agent/VIDEO AGENT/config/teksten.json` en klantbrein §6).
5. **Ontbrekend veld** → script niet invullen; open vraag met het nummer van de onboardingvraag.
6. **Lengte** 30–38 woorden; 2 hooks met visuele hook; drie verschillende formats.
7. **Namen en plaatsen** van particulieren (bv. de klant op de werf) alleen als de briefing zegt dat het mag; anders vraag.

## 7. Uitvoer

- Formaat: `script-sjabloon.md` (naast dit bestand). Eén bestand per versie: `scripts_v<N>.md`, **nooit overschrijven**;
  een nieuwe ronde = nieuwe versie, ook bij kleine wijzigingen. Zelfde regel voor `scriptbriefing_v<N>.md`.
- Plaats: tot er een klantmap in video-agent is (open vraag in `VOORTGANG.md`): `01-scriptbot/voorbeelden/<klant>/`.
- Per script: de velden van `01_SCRIPT.md` (titel, outputvarianten H01/H02, hooks + visuele hook, body, einde), zodat
  de videobot ze één op één overneemt; codes `<KODE> - S<n> - H<n>` zoals in `10_ADVERTENTIETEKSTEN.md`.
- Per script een **dia-versie** voor het kick-offdeck (03): titel, format, spreektekst, tekst in beeld, vlag, ja/nee.
- Onderaan: de open vragen (gebundeld, met het nummer van de onboardingvraag) en de zelfcontrole (§6).

## 8. Nakijken

- **Thibo** kijkt de scripts na (±15 min, controlemoment *Kick-off prep* stap 11), ook elke prijs tegen de briefing.
- Geld en klantafspraken (prijzen, promoties, beloftes) nooit zonder akkoord: de bot neemt alleen over wat de klant zelf
  zei, en de klant bevestigt het in de kick-off.
- De bot verstuurt niets en schrijft niets naar Client Check, Strilio of de klant. Open vragen gaan via de kick-off-agent
  mee in de toegangsmail (*Kick-off prep* stap 3), die een mens verstuurt.
