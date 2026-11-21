# Voortgang 01-scriptbot

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan.

## Status
Plan klaar en besproken; nog niets gebouwd.

## Logboek
- 2026-11-21 (sessie 2): bronnen en repo's gelezen (alleen lezen). Formaat van de scriptbriefing en plan voor de bot opgesteld,
  uitgewerkt met het EGS-voorbeeld (zie hieronder). CLAUDE.md van de map gecorrigeerd: `BRIEFING.md` toont 8 scripts per klant (niet 3),
  pad van `teksten.py`, bestaand sjabloon `templates/briefing.md`, oude tabel `strategy_scripts` in Client Check.
- 2026-11-21: map aangemaakt met context uit het bouwplan.

## Plan
**Scriptbriefing** (één bestand per klant, versie per ronde): tabel met veld, waarde, bron (onboardingvraag / Qwilr / site /
Fireflies + tijd) en status. Velden: aanbod en focus (v1), niet promoten (v2), prijsvork (v3), promotie + einddatum (v4), USP's (v5),
vragen en bezwaren (v6, bron voor de hooks), werf: wat, waar, prijs (v7), wie in beeld (v8), shootdata (v9), regio (v10), website en
huisstijl, aanspreekvorm en verboden woorden (klantbrein §6). Onbekend blijft `onbekend` en komt onder "Open vragen".

**Bot:**
1. Invoer: scriptbriefing, klantbrein, website.
2. Format per script uit de set van `video-agent/BRIEFING.md` (persoon in beeld, foto swipe, voice-over, voor/na, reviews, behind the
   scenes, vraag & antwoord, statement).
3. Per script: titel, format, vlag klant acteert / acteur nodig / open (v8), beeld, spreektekst (12-15 s, ±30-38 woorden), tekst in
   beeld, eindtekst, 2 gesproken hooks uit v5/v6 + visuele hook (`06_MONTAGEPROFIEL.md` §4).
4. Controle: elk feit verwijst naar een briefingveld; bedragen met "ongeveer" of "vanaf"; promotie alleen met einddatum; geen review
   of resultaat zonder bron.
5. Uitvoer: leesbaar voor de videobot (per script naar `01_SCRIPT.md`) en een script per dia voor het kick-offdeck (03).
6. Thibo kijkt na (±15 min), ook de prijs.

**EGS-voorbeeld (concept, alleen feiten uit de briefing):**
- S1 "Wat kost het vandaag?", persoon in beeld bij Peter thuis. H01 "Wat kosten 12 zonnepanelen met een thuisbatterij vandaag?",
  H02 "Zonnepanelen én een batterij van 10 kWh: wat betaal je daar nu voor?". Spreektekst: "Hier bij Peter plaatsten we 12
  zonnepanelen en een thuisbatterij van 10 kWh. Wat kost dat vandaag? Voor deze installatie: ongeveer 7.000 euro." Vlag: open (v8).
- S2 voice-over op werfbeelden; USP open (v5), plaats batterij onbekend.
- S3 vraag & antwoord; vraag open (v6). Zonder antwoord uit de briefing wordt S3 niet geschreven.

## Beslissingen
- 2026-11-21: standaard 3 scripts met elk 2 hooks per klant (Eghosa).
- 2026-11-21: het EGS-voorbeeld blijft voorlopig in deze map; geen klantmap in video-agent tot EGS echt video's krijgt (Eghosa).

## Open vragen
- Klantmap "EGS Projects" in video-agent: later, en in welke kloon (`~/Developer/video-agent` of `~/Desktop/video-agent`)?
- Regio, promotie, USP's, bezwaren en wie in beeld bij EGS: onbekend (komt uit de onboardingcall).
- De prijs in een script (bv. ±€7.000) komt van de klant; Thibo bevestigt bij het nakijken.
