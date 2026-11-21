# Voortgang 05-briefing-check

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan.

## Status
Plan klaar; samenwerk met Thibo afgesproken. Nog niets gebouwd.

## Logboek
- 2026-11-21 (sessie 2): bronnen en repo's gelezen (alleen lezen). Gevonden: concept-skill `wrike-briefing` van de nachtploeg
  (`night-shift-thibo/dag/2026-11-21/briefing-skill/SKILL.md`). Plan voor de skill en een concept van 10 huisregels met bron opgesteld.
  Lijst "wat er in design-, video- en shoottaken altijd in de briefing moet" opgesteld voor Thibo (zie hieronder). CLAUDE.md van de
  map bijgewerkt (titelformaat, concept-skill, dubbelcontrole).
- 2026-11-21: map aangemaakt met context uit het bouwplan.

## Plan voor de skill
1. Klant bepalen (`search_clients`, klantcode).
2. Zelf context zoeken: `get_client_overview`, `search_conversations` (mail, WhatsApp, telefoon, meetings, Wrike-reacties), `search_wrike_tasks`.
3. Bestaande taak zoeken: bestaat er al een open taak over hetzelfde, dan een reactie voorstellen in plaats van een nieuwe taak (`wrike-run createTask` controleert niet op dubbels).
4. Vragen tot compleet: eerst tonen wat gevonden is ("ik zie dat …, klopt dat?"), max 3 vragen per ronde, nooit vragen wat in de bronnen staat; toets "kan ik dit zelf uitvoeren zonder terug te vragen?" op wat, klant, waarom, deadline, wie, bronnen, klaar als, mag niet. Een vage vraag geeft vragen, nooit een taak.
5. Tonen (titel, map, beschrijving), aanmaken na "ok", teruglezen.

Taakbeschrijving in vaste blokken: Wat · Waarom · Context (citaten met bron en datum) · Bronnen en links · Klaar als · Mag niet · Huisregels die gelden.

## Concept-huisregels (voor Wannes)
1. Floors & More is de kwaliteitslat (briefing §11, §13).
2. In video's spreekt altijd een persoon; spreker eerst, dan B-roll/foto's, dan pas grafisch (briefing §13; `video-agent/VIDEO AGENT/00_BASIS.md` §1).
3. Huisstijl van de website van de klant, nooit van een andere klant (`video-agent/CLAUDE.md`; `00_BASIS.md` §1).
4. Eerst echte beelden van de klant, anders AI, nooit stock (`06_MONTAGEPROFIEL.md:213`; `07_STATICS.md:57`).
5. Niets rechtstreeks naar de klant; klantmails alleen via Romina (cc Wannes) (briefing §13; `sprout-lead-core-new/CLAUDE.md`; night-shift Z3).
6. Geen verzonnen feiten, reviews of resultaten; prijzen als "vanaf"; prijs of belofte alleen met akkoord (`10_ADVERTENTIETEKSTEN.md` §2.3; `mail-bot/CLAUDE.md`; night-shift N3).
7. Klanten die per lead betalen (o.a. Kinetico): nooit kosten tonen (`night-shift-thibo/regels/feedback.md` 19/11).
8. Leadformulier: sharing Open, conditionele logica met eindpagina, aparte velden (`feedback.md` 17/11).
9. Calculator: vanaf de template, alleen vragen die de richtprijs bepalen, alleen de totale richtprijs (`feedback.md` 10/11, 19/11).
10. Blijf binnen de briefing: "copy aanpassen" is alleen copy (`feedback.md` 16/11).

Reserve: eerste oplevering alleen story met 3 advertentieteksten per visual; max één organische post per dag; nieuw formulier = bestaande Zap ombouwen.
Regels 7-10 zijn feedback van Thibo (hij bevestigt); Wannes keurt de lijst.

## Briefing per taaktype: design, video, shoot (deel van Eghosa)
Video: 1 exacte bron van de beelden (`video-agent/BRIEFING.md:6`, `00_START_HIER.md:90`) · 2 script + aantal hooks (`09_OPDRACHTEN.md:44-50`) ·
3 wie de hoofdspreker is (`05_FEEDBACKLOG.md:340`, `:407`) · 4 welke beelden bij welk script (`05_FEEDBACKLOG.md:433`) · 5 ad of organisch,
CTA, bestemming, prijs als vork/"vanaf" (`templates/briefing.md`, `10_ADVERTENTIETEKSTEN.md` §2.3, `05_FEEDBACKLOG.md:637`) · 6 website bij een
nieuwe klant (`00_BASIS.md` §1) · 7 kwaliteitswens met referentie (`BRIEFING.md:9`) · 8 klantfeedback uitgeschreven met bron (`BRIEFING.md:7`).
Statics/posts: 9 aantal, onderwerp en tekst per static (`05_FEEDBACKLOG.md:493`) · 10 vaste velden per posttemplate (briefing §11).
Shoot: 11 adres, datum, contact, wie in beeld + toestemming, wat geplaatst en prijs (onboardingvragen 7-9) · 12 welke scripts + opnamelijst
van wat ontbreekt (briefing §17) · 13 bij een event: terugblik of aankondiging (`12_VRIJ.md` §3.1).
Niet gecontroleerd: of de Wrike-briefings zelf zo vaag waren (Wrike niet gelezen).

## Beslissingen
- 2026-11-21: taak 13 is samenwerk met Thibo. Eghosa: design-, video- en shoottaken; Thibo: marketing-, ads- en funneltaken. Daarna vult
  Wannes de huisregels aan en installeren ze de skill voor het team. We bouwen verder op het concept van de nachtploeg.

## Open vragen
- Wat betekent NN in het titelformaat `NN | KLANTCODE omschrijving`? (gevraagd aan Thibo)
- Wrike-mapstructuur per klant (welke map per soort taak)?
- Installatie in het teamaccount van Claude: wie doet het (Claude Code kan dat niet volgens de nachtploeg)?
