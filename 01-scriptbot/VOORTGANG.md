# Voortgang 01-scriptbot

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan.

## Status
Nieuw ontwerp gebouwd en lokaal getest: **scripts per klant** (geen Opstart meer). Portaal: commit `74b0f8d` op main
(migratie 20261121200000 herschreven, nog NIET live in Client Check). Bot: creatieve-motor (video-agent) commit `4e10e755`.
Wacht op: Eghosa zet de migratie live, daarna de app; dan de eerste echte klant met de opname van de onboardingcall.

Live zetten (Eghosa, in deze volgorde):
1. In `revenuelab-portaal`: `/usr/bin/python3 scripts/migratie_live.py 20261121200000` maakt `live/20261121200000_live.sql`
   en `_terug.sql` (lokaal proefgedraaid: live → terug → live, daarna 88 tests groen).
2. `scripts/clientcheck.sh sql live/20261121200000_live.sql` (één transactie; stopt zelf als Client Check niet op
   20261120120000 staat). Terug: `_terug.sql`.
3. `scripts/clientcheck.sh functies` (de Edge Function `portaal-bot` met de nieuwe acties klantfeiten, klantfeiten_voorstellen, transcripties,
   scriptronde, scripts_opleveren).
4. De app: `scripts/clientcheck.sh app`.
5. Op de laptop met de werker: `git pull` in creatieve-motor (de werker kent dan taaksoort `scripts`).

## Logboek
- 2026-11-21 (sessie 6): ander ontwerp op vraag van Eghosa ("niet in een campagne bij de andere uitingen, wel in dezelfde
  tool, en nieuwe scripts kunnen laten genereren"). Gebouwd:
  - Portaal: klantpagina met tabs Campagnes · Scripts · Klantfeiten; scriptrondes per klant (kick-off, promotie,
    invalshoek, meer hooks, anders; 1-6 scripts, 1-3 hooks); aanvragen via *Nieuwe opdracht → Scripts* (alleen team);
    rondepagina met rechtstreeks aanpassen (nieuwe versie `handmatig`), feedback naar de bot, nakijken door iedereen
    (het portaal bewaart wie), klantakkoord per ronde (standaard bij kick-off en promotie, kick-off altijd), koppelen per
    script aan campagnes, *Naar productie* (koppelt automatisch); blok Scripts op een advertentiecampagne; "Scripts om
    na te kijken" op Wacht op jou. Opstart-code weg.
  - Bot: `tools/scripts.py` per ronde (`scripts/ronde-N/`), werker met taaksoort `scripts` (licht, zonder FilmCraft).
  - Onafhankelijke nakijkronde: 3 belangrijke fouten (feit veranderd werd gewist door een nieuwe versie; de bot kon een
    handmatige aanpassing overschrijven of een goedgekeurde ronde wijzigen; dubbele oplevering), 6 kleinere (versie van
    de bot meteen bij de klant, twee keer naar productie, duizendtalpunt in de bedragcontrole, twee taken tegelijk,
    vraag van de bot telde niet als open, vrij format en datumveld). Alle opgelost en getest.
  - Getest: 88 databasetests, 60 app-tests, 79 bottests (scripts + werker), de hele lus in de browser (aanvragen →
    bot → feedback → aanpassen → feiten → nakijken → klant → akkoord → productie → koppelen) op 1440 en 390 px.
- 2026-11-21 (sessie 5): fase 2 tot 4 gebouwd. Keuzes van Eghosa: Opstart bouw ik als basis (ook voor de posts van de
  branding agent), bevestigen van klantfeiten in het portaal.
  - Portaal (revenuelab-portaal `d102582`): campagnetype `opstart` (één per klant, type ligt vast, geen opdrachten);
    `portaal.klantfeiten` + historiek (bot stelt voor, bevestigd blijft, schatting alleen voor prijs); `scriptsets`,
    `scripts` (inhoud ligt vast), `scriptfeedback`; statussen concept → nagekeken → klaar_voor_kickoff (alle feiten in
    de scripts bevestigd) → goedgekeurd (3× akkoord in de kick-off; aanpassen = feedback, bot levert na de kick-off,
    ongewijzigde scripts houden hun akkoord); `scripts_naar_opdracht` maakt een video-ad-opdracht via
    `opdracht_starten` (SD-kaart, wacht op footage). Bot-acties: opstart, klantfeiten, klantfeiten_voorstellen,
    transcripties (Fireflies uit Client Check, alleen lezen), scripts_opleveren, scripts. Scherm Opstart op de
    campagnepagina (scripts, feedback, klantfeiten bevestigen/aanpassen, kick-off, shootlijst, naar productie).
    57 databasetests, build en apptests groen; schermcontrole met Chrome (1440 en 390 px) zonder fouten.
  - Live-script gemaakt met `scripts/migratie_live.py` en proefgedraaid: live → terug → opnieuw live, en een tweede
    keer live weigert. Live staat op Postgres 15.8 en op t/m 20261120120000 (precies wat het script verwacht); lokaal
    getest op Postgres 17 (de config van de repo), niet op 15.
  - Bot (video-agent `9825f037`): `tools/scripts.py` opstart, transcripties, feiten-voorstellen, feiten-ophalen,
    opleveren, ophalen; 16_SCRIPTS.md en skill bijgewerkt; 32 tests. Volledige lus getest tegen de lokale database.
  - Niet getest: de Edge Function `portaal-bot` zelf (de lokale runtime krijgt hier geen geheim en geen npm via de
    proxy); de wijziging is alleen de lijst toegelaten acties.
  - Onafhankelijke nakijkronde (verse agent): niets blokkerend, 3 belangrijke logicafouten (een aangepast feit liet een
    script met de oude prijs door; open feedback hield de kick-off niet tegen; bevestigen bevestigde wat er intussen
    stond) en enkele kleine; alle opgelost in `a633dcf` met tests (62), schermcontrole en live-proef opnieuw groen.
  - Live zetten (Eghosa, op de laptop met het portaal): `git pull`; `supabase start`; `supabase db reset`;
    `/usr/bin/python3 scripts/migratie_live.py 20261121200000`; `scripts/clientcheck.sh sql live/20261121200000_live.sql`;
    `scripts/clientcheck.sh functies`; `scripts/clientcheck.sh app`. Terug: `live/20261121200000_terug.sql`.
  - Gevonden, niet van mij: `supabase/tests/feedback_bron.test.sql` en `feedback_doorsturen.test.sql` falen al op main
    (ook zonder deze migratie).
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
- 2026-11-21 avond: scripts niet in een campagne maar per klant op een eigen tab, in rondes; aanvragen alleen door het
  team; de werker schrijft ze automatisch; iedereen van het team kijkt na; het team past rechtstreeks aan in het portaal;
  klantakkoord per ronde; koppeling per script aan een of meer campagnes (Eghosa: "ja goed").
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
- Live zetten van migratie 20261121200000 en de app (stappen onder Status).
- Slack-melding bij nieuwe scripts of feedback; Wrike-taken (Thibo nakijken, shoot Hermann) via de Vault.
- Klantfeiten ook leesbaar in de MCP van Client Check (nu via portaal-bot).
- Voorbeelden: welke opgeleverde scripts zijn de lat, en welke werden afgekeurd en waarom? (Eghosa)
- Afstemmen met Thibo: taak 14 "Nieuwe klant in één opdracht" vraagt ook de scriptbriefing.
- Leest `get_conversation` (MCP Client Check) de volledige transcriptie? Nog niet getest.
