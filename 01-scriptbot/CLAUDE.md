# 01 Scriptbot

Lees eerst `../CLAUDE.md`.

## Doel
Uit de klantbriefing (onboardingcall + Qwilr + website) de videoscripts schrijven, gepersonaliseerd met hun site, prijs en promotie,
met per script de vlag "klant acteert zelf" of "acteur nodig". De scripts worden in de kick-off goedgekeurd of aangepast.

## Bron in de briefing
- "Script bot: Eghosa, tonight. Fed by the kick-off agent's script briefing." (Owners from the discussion)
- Kick-off prep, stap 5: "the script bot writes them from the briefing, personalised with their site, price and promotion, and flags whether the client acts or we need an actor."
- Voorbeeld: EGS, 12 panelen + 10 kWh-batterij bij Peter thuis, "wat kost dat vandaag, ongeveer 7k".
- Kick-offdeck: scripts een per dia, ter plaatse goedgekeurd; de shoot (locatie, wie in beeld, datum).

## Wat al bestaat
- `video-agent/VIDEO AGENT/templates/video_project/01_SCRIPT.md`: sjabloon per video.
- `video-agent/BRIEFING.md`: voorbeeldscripts (ABBI, Floors & More) zoals ze nu met de hand geschreven worden. Dat is de lat.
- `video-agent/VIDEO AGENT/10_ADVERTENTIETEKSTEN.md` + `tools/teksten.py`: regels voor teksten (lengtes, verboden woorden).
- Klantbrein per klant: `video-agent/VIDEO AGENT/Video Projecten/<klant>/00_KLANTBREIN.md`.
- Een scriptbot bestaat nog niet.

## Wat je bouwt
- [ ] Invoer: de "scriptbriefing" (komt uit 02-kickoff-agent). Tot die bestaat: met de hand een briefing in hetzelfde formaat.
- [ ] Vast formaat van de scriptbriefing: aanbod en focus, prijsvork, lopende promotie + einddatum, USP's, bezwaren (vraag 5 en 6), werf/locatie + wat er geplaatst wordt + prijs (vraag 7), wie in beeld (vraag 8), regio.
- [ ] Scripts in het formaat van `01_SCRIPT.md`, aantal en lengte zoals in `BRIEFING.md` (bv. 12 tot 15 seconden, verticaal).
- [ ] Per script: format (persoon in beeld, foto swipe, voice-over), spreektekst, tekst in beeld, vlag klant/acteur.
- [ ] Hooks uit de echte vragen en bezwaren van hun klanten (deckregel 8: drie hooks uit hun klantvragen).
- [ ] Controle: geen feiten die niet in de briefing staan; onbekend = vraag, niet verzinnen.
- [ ] Uitvoer leesbaar voor de videobot (in de klantmap) en bruikbaar als dia in het kick-offdeck (03).

## Klaar als
- Voor een testklant (EGS-voorbeeld) levert de bot scripts met de echte prijs en installatie, zonder verzonnen claims.
- Thibo kan ze in ongeveer 15 minuten nakijken (controlemoment uit de briefing).

## Werk in
`video-agent` (de scripts horen bij de klantmap). Lees daar eerst `CLAUDE.md` en `VIDEO AGENT/00_BASIS.md`.

## Hangt samen met
02 (levert de scriptbriefing), 03 (scripts op dia's), 04 (zelfde huisstijl), 08 (shootplanning).

## Open vragen
- Hoeveel scripts per klant standaard? (BRIEFING.md toont er 3 per klant.)
