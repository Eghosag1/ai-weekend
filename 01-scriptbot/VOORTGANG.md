# Voortgang 01-scriptbot

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan.

## Status
Eerste versie van de skill klaar (`skill/`), getest op papier met een anonieme testklant (`voorbeelden/testklant/`).
Nog niet geïnstalleerd en nog niet in video-agent.

## Logboek
- 2026-11-21 (sessie 3): skill gebouwd door een achtergrondagent en nagekeken: `skill/SKILL.md`, `skill/scriptbriefing-sjabloon.md`,
  `skill/script-sjabloon.md`. Testrun: `voorbeelden/testklant/scriptbriefing_v1.md` + `scripts_v1.md` (S1 volledig, 30-34 woorden,
  2 hooks met visuele hook; S2 en S3 bewust open tot vraag 5 en 6 beantwoord zijn; zelfcontrole onderaan). Het voorbeeld eerst op EGS
  gemaakt en daarna geanonimiseerd (geen echte klantgegevens in git). Spreektekst van de prijs aangepast tot voorbeeldprijs van
  deze ene installatie. Velden CTA (h4) en beeldmateriaal (h5) toegevoegd aan de scriptbriefing.
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

**Testklant:** zie `voorbeelden/testklant/` (anoniem; alleen de cijfers uit het voorbeeld in de briefing, r. 64).

## Beslissingen
- 2026-11-21: standaard 3 scripts met elk 2 hooks per klant (Eghosa).
- 2026-11-21: we testen de scripttool met een anonieme testklant, niet met EGS (geen echte klantgegevens in git). Geen klantmap in video-agent tot een klant echt scripts krijgt (Eghosa).
- 2026-11-21: de scriptbriefing krijgt ook de velden CTA en beeldmateriaal (nodig voor het einde in `01_SCRIPT.md`).

## Open vragen
- Waar komt de skill uiteindelijk: in video-agent (welke kloon: `~/Developer/video-agent` of `~/Desktop/video-agent`) of in het teamaccount?
- De prijs in een script komt van de klant; Thibo bevestigt bij het nakijken (ook btw en premie).
- Deckregel 8 (drie hooks uit klantvragen) kan pas gehaald worden met antwoorden op vraag 6.
- De bouwspecificatie (PDF) is niet gelezen door de agent (geen PDF-tools); de nieuwste briefing is gevolgd.
