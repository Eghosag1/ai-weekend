# Huisregels voor de briefing check (taak 13)

**Status: CONCEPT – Thibo bevestigt regels 7–10, Wannes keurt de lijst.**

Wat nergens anders staat: onze kwaliteitslat. De skill (`skill/SKILL.md`) zet in elke taak alleen de regels die gelden.
Elke regel heeft een bron. Kolom "Nachtploeg" = staat de regel ook in het concept van de nachtploeg
(`night-shift-thibo/dag/2026-11-21/briefing-skill/SKILL.md`, sectie "Huisregels", nummer daar).

Afkortingen: briefing = `AI-Weekend/00-bronnen/briefing-wannes-2026-11-21.md`; VA = `video-agent/VIDEO AGENT/`;
feedback = `night-shift-thibo/regels/feedback.md` (rij met datum).

| # | Regel | Bron | Nachtploeg |
|---|---|---|---|
| 1 | **Floors & More is de kwaliteitslat.** Output op het niveau dat we met de hand zouden leveren, geen AI slop. | briefing §11 "Quality bar" ("Benchmark: the Floors and More content"); briefing §13 "House rules" | ja (1) |
| 2 | **In video's spreekt altijd een persoon.** Beeld in deze volgorde: de spreker, dan B-roll of foto's, pas dan een volledig grafisch scherm. | briefing §13 "House rules" ("always a person speaking in videos"); VA `00_BASIS.md` §1 Begrippen, rij "Beeld" | ja (2), zonder de volgorde |
| 3 | **Huisstijl van de website van de klant**, nooit de stijl van een andere klant. Geen website: vragen, niet ontwerpen. | `video-agent/CLAUDE.md:40`; VA `00_BASIS.md` §1 Begrippen, rij "Huisstijl" | nee |
| 4 | **Eerst echte beelden van de klant, anders AI, nooit stock.** | VA `06_MONTAGEPROFIEL.md:213` (§5); VA `07_STATICS.md:57`; VA `05_FEEDBACKLOG.md:581`; VA `templates/briefing.md:26` | nee |
| 5 | **Niets rechtstreeks naar de klant.** Klantmails verstuurt alleen Romina, in naam van Wannes: een Wrike-reactie die begint met "@Romina (cc @Wannes)" en dan meteen de mail. | briefing §13 stap 3 ("nothing goes straight to the client"); `sprout-lead-core-new/CLAUDE.md:17`; `night-shift-thibo/CLAUDE.md:55` (Z3); feedback 18/11 en 19/11 (KINE) | nee als huisregel; staat in het concept als voorbeeld van "wat niet mag" (werking stap 4) |
| 6 | **Geen verzonnen feiten, reviews of resultaten.** Prijzen als "vanaf" (calculator: als prijsvork). Een prijs of belofte aan de klant alleen met akkoord. | VA `10_ADVERTENTIETEKSTEN.md` §2 punt 3; VA `05_FEEDBACKLOG.md:637` (prijsvork); `mail-bot/CLAUDE.md:43-44`; `night-shift-thibo/CLAUDE.md:90` (N3) | deels: "Nooit: deadlines of prijzen verzinnen" |
| 7 | **Klanten die per lead betalen (o.a. Kinetico): nooit kosten tonen** (geen CPL, besteed bedrag, CPM). Alleen aantallen en wat de leads antwoordden. | feedback 19/11 (KINE AM update) | ja (5) |
| 8 | **Leadformulier:** sharing Open, conditionele logica met een eindpagina voor wie nog oriënteert, apart voornaam, achternaam, e-mail, telefoon, straat en nummer, postcode. | feedback 17/11 (LONI leadformulier) | ja (3) |
| 9 | **Calculator:** vertrekt van de template, stelt alleen vragen die de richtprijs bepalen, toont alleen de totale richtprijs (geen opsplitsing). | feedback 10/11 (calculators; QBUI calculator) en 19/11 (PERF calculator) | ja (4), zonder "vanaf de template" |
| 10 | **Blijf binnen de briefing.** "Copy aanpassen" is alleen copy: niets aan formulier, video's of opzet. | feedback 16/11 (COSY) | ja (7) |

Regels 7–10 komen uit feedback van Thibo: hij bevestigt ze. Wannes keurt de hele lijst en vult aan.

## Reservelijst (niet in de 10, wel met bron)

- Eerste oplevering alleen in story, met 3 advertentieteksten per ad-visual. Bron: VA `09_OPDRACHTEN.md:46-50`. Nachtploeg: nee.
- Per klant max. één organische post per dag (FB en IG samen). Bron: feedback 13/11 (JANS posts). Nachtploeg: ja (6).
- Nieuw formulier: de bestaande Zap van de klant ombouwen, geen kopie. Bron: feedback 10/11 (VEST Zap) en 16/11 (BATI). Nachtploeg: ja (9).

## Regel uit het concept die hier bewust niet staat

- Nachtploeg 8: "Taken van vandaag staan vandaag op Done; 'Opvolgen' alleen als we echt even niet verder kunnen"
  (feedback 9/11). Dat gaat over de afwerking van taken, niet over de briefing. Beslissing voor Thibo/Wannes of ze
  erbij moet.
