# Voortgang 01-scriptbot

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan.

## Status
Fase 1 gebouwd in video-agent (commit `78ea3340` op main, repo nu `Eghosag1/creatieve-motor`). Volgende: test op een
echte nieuwe klant (met een Fireflies-transcriptie), daarna fase 2 (tabel klantfeiten in Client Check).

## Logboek
- 2026-11-21 (sessie 4, vervolg): fase 1 gebouwd in video-agent: `VIDEO AGENT/16_SCRIPTS.md`, `tools/scripts.py`
  (start, nieuw, controle, md, video, lijst), `config/scripts.json`, `templates/klant/scriptbriefing.json`, skill
  `scriptbot` (+ link in `.claude/skills/`), regel 14 in `AGENTS.md`. Controle weigert: getal of bedrag zonder bron,
  bedrag zonder "ongeveer"/"vanaf", feit dat niet letterlijk in het script staat of op een onbekend veld steunt, promotie
  zonder (of met verlopen) einddatum, schatting buiten prijs, verboden woorden, minder of meer dan 3 scripts × 2 hooks,
  dubbele formats, geen spreker in beeld; vanaf `klaar_voor_kickoff` ook open scripts, open vlag en elke schatting.
  Waarschuwt: lengte buiten 30-38 woorden, claimwoorden zonder feit, iets uit "niet promoten", open vragen.
  22 tests (`tools/tests/test_scripts.py`). Testrun op een fictieve klant `Video Projecten/_TEST - Scriptbot/`
  (S1 en S2 klaar, S3 bewust open omdat vraag 6 onbekend is): IN ORDE.
  Bekende grens: uitgeschreven claims zonder cijfer ("duizenden klanten") krijgen alleen een waarschuwing; de inhoud
  tegen de bron controleren blijft werk van de agent en van Thibo.
- 2026-11-21 (sessie 4): analyse van alle repo's (alleen lezen) en een telling op de live Client Check (alleen SELECT).
  Gevonden: scriptbot v1 in `4cef105` (nooit geïnstalleerd); 89 scripts in video-agent bij 19 klanten, 25 video's met
  KLANT AKKOORD; creative-spark-engine (stil sinds juli, `strategy_scripts` 44 rijen, laatste 21/04); `portaal.briefings`
  als goedkeuringspatroon (0 rijen); 105 Fireflies-transcripties in Client Check; Qwilr leest geen offerte-inhoud.
  Architectuur voorgesteld en goedgekeurd. Map terug aangemaakt.
- 2026-11-21 (sessie 3): skill v1 gebouwd en getest op papier (zie `4cef105`).
- 2026-11-21: map aangemaakt.

## Beslissingen
- 2026-11-21: scripts in het portaal (feedback daar), geen Google Docs (Eghosa).
- 2026-11-21: de commerciële klantfeiten in Client Check (Eghosa).
- 2026-11-21: 3 scripts × 2 hooks (Eghosa).
- 2026-11-21: Eghosa bouwt zelf de onboardingtool van Revenue Lab; geen tweede intake, `kickoff_intakes` van
  creative-spark-engine niet gebruiken.
- 2026-11-21: Wannes doet de onboardingcall en stelt de scriptvragen (promotie + einddatum, wie in beeld, waar filmen);
  geen extra vragen in de onboardingtool.
- 2026-11-21: prijzen: die van de klant, of een realistische "vanaf"-schatting van de bot die zichtbaar als schatting
  gemarkeerd is en door Thibo bevestigd wordt vóór de kick-off (Eghosa: "goed").
- 2026-11-21: na goedkeuring een video-ad-opdracht die wacht op footage; clips kies je met de hand als de kaart in de pc zit.

## Open vragen
- Voorbeelden: welke opgeleverde scripts zijn de lat, en welke werden afgekeurd en waarom? (Eghosa)
- Afstemmen met Thibo: taak 14 "Nieuwe klant in één opdracht" vraagt ook de scriptbriefing.
- Leest `get_conversation` (MCP Client Check) de volledige transcriptie? Nog niet getest.
