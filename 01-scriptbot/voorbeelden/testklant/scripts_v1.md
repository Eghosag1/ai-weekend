# Scripts – Testklant Zon – v1

> Testrun van de scriptbot volgens `../../skill/SKILL.md` en `../../skill/script-sjabloon.md`.
> Invoer: `scriptbriefing_v1.md`. Elk feit krijgt het briefingveld tussen haken.
> Vaste aanpak: verticaal, ±12–15 s, ±30–38 gesproken woorden per video (hook inbegrepen).

- Datum: 2026-11-21
- Scriptbriefing: `voorbeelden/testklant/scriptbriefing_v1.md`
- Status: concept, na te kijken door Thibo (±15 min, ook de prijs). Er is nog geen onboardingcall: alleen S1 is ingevuld.

## Overzicht

| Code | Titel | Format | Vlag | Klaar? |
| --- | --- | --- | --- | --- |
| `TEST - S1` | Wat kost het vandaag? | PERSOON IN BEELD | open (v8) | ja, onder voorbehoud van v7 en v8 |
| `TEST - S2` | Waarom klanten voor de klant kiezen (werktitel) | VOICE-OVER | open (v8, stem) | open: v5 |
| `TEST - S3` | Hun meest gestelde vraag (werktitel) | VRAAG & ANTWOORD | open (v8) | open: v6 |

Klantcode `TEST` is een werkcode voor de bestandsnamen (anonieme testklant).

---

## S1. Wat kost het vandaag? — PERSOON IN BEELD

Format: persoon in beeld op de werf, één concreet bedrag rechtstreeks in camera.
Vlag: open (v8). Wie spreekt, staat niet in de briefing.
Beeld: spreker staat bij de installatie [v7a, v7b] en spreekt in camera. Tijdens "12 zonnepanelen" kort de panelen in
beeld, tijdens "thuisbatterij" de batterij (B-roll van dezelfde werf, geen stock). Eindigen op de spreker.

### Velden voor `01_SCRIPT.md`

| Variant | Hook | Vereiste output |
| --- | --- | --- |
| `H01` | Wat kosten 12 zonnepanelen met een thuisbatterij vandaag? | Volledige video met body en CTA |
| `H02` | Wat betaal je vandaag voor zonnepanelen én een batterij? | Volledige video met dezelfde body en CTA |

**Hook 1:** "Wat kosten 12 zonnepanelen met een thuisbatterij vandaag?" [v7a, v7c: "wat kost dat vandaag"]
Visuele hook H01:
- Kicker: `WAT KOSTEN 12`
- Grote woorden en wisselmoment: `ZONNEPANELEN (op "zonnepanelen") -> BATTERIJ (op "thuisbatterij")`
- Regel eronder: `VANDAAG?`

**Hook 2:** "Wat betaal je vandaag voor zonnepanelen én een batterij?" [v7a, v7c]
Visuele hook H02:
- Kicker: `WAT BETAAL JE VANDAAG VOOR`
- Grote woorden en wisselmoment: `PANELEN (op "zonnepanelen") -> BATTERIJ (op "batterij")`
- Regel eronder: `?` (of geen)

**Body (spreektekst):** "Hier: 12 zonnepanelen en een thuisbatterij van 10 kWh. Voor deze installatie: ongeveer
7.000 euro." [v7a, v7c] (voorbeeldprijs van deze ene installatie, geen prijs voor iedereen)
- Alleen als v7d = ja: "Hier **bij <voornaam> thuis**: …" [v7b] (+3 woorden).

**Tekst in beeld:** `12 zonnepanelen + thuisbatterij 10 kWh` [v7a] · `Ongeveer €7.000` [v7c]
**Einde (eindtekst + CTA):** spreektekst "Benieuwd wat het bij jou zou kosten?" · eindtekst `Wat kost het bij jou?` ·
bestemming: OPEN (h4: calculator, offerteformulier of afspraak?)
**Woorden:** H01 + body + einde = 30 (33 met "bij <voornaam> thuis"); H02 + body + einde = 31 (34).
**Transcriptie-match:** na de shoot in te vullen door de videobot.

### Dia-versie (kick-offdeck, deel 3)

| Titel | Format | Spreektekst | Tekst in beeld | Vlag | Akkoord |
| --- | --- | --- | --- | --- | --- |
| Wat kost het vandaag? | Persoon in beeld op de werf | "Wat kosten 12 zonnepanelen met een thuisbatterij vandaag? Hier: 12 zonnepanelen en een thuisbatterij van 10 kWh. Voor deze installatie: ongeveer 7.000 euro. Benieuwd wat het bij jou zou kosten?" | 12 zonnepanelen + thuisbatterij 10 kWh · Ongeveer €7.000 | Open: wie spreekt? | ja / nee |

---

## S2. Waarom klanten voor de klant kiezen (werktitel) — VOICE-OVER

Format: praktijkbeelden van de installatie met één duidelijke boodschap (zoals ABBI 3).
Vlag: open (v8). Ook een voice-over heeft een stem nodig.
Beeld: werfbeelden van dezelfde installatie [v7a]: panelen, batterij, het team aan het werk. Geen stock.

### Velden voor `01_SCRIPT.md`

| Variant | Hook | Vereiste output |
| --- | --- | --- |
| `H01` | OPEN: hook uit de belangrijkste reden waarom klanten de klant kiezen (v5) | Volledige video met body en CTA |
| `H02` | OPEN: tweede hook uit v5, of een klantvraag uit v6 | Volledige video met dezelfde body en CTA |

**Hook 1:** OPEN (v5). Visuele hook H01: na de hook.
**Hook 2:** OPEN (v5/v6). Visuele hook H02: na de hook.
**Body (voice-over):** OPEN (v5). Structuur: `<reden 1 uit v5>. <reden 2 uit v5>. <waarom dat telt voor de klant, in hun woorden>.`
**Tekst in beeld:** OPEN: 2–3 woorden per reden uit v5.
**Einde:** OPEN (h4).
**Woorden:** –

Niet ingevuld: zonder v5 zou elke reden ("snel", "lokaal", "vakmanschap") verzonnen zijn.

### Dia-versie (kick-offdeck, deel 3)

| Titel | Format | Spreektekst | Tekst in beeld | Vlag | Akkoord |
| --- | --- | --- | --- | --- | --- |
| Waarom klanten voor de klant kiezen | Voice-over op werfbeelden | Nog in te vullen na antwoord op v5 | – | Open: wie spreekt de voice-over? | ja / nee |

---

## S3. Hun meest gestelde vraag (werktitel) — VRAAG & ANTWOORD

Format: veelgestelde vraag rechtstreeks beantwoord door de expert (zoals Floors & More 6).
Vlag: open (v8).
Beeld: spreker bij de installatie [v7a]; de vraag staat bovenaan in beeld.

### Velden voor `01_SCRIPT.md`

| Variant | Hook | Vereiste output |
| --- | --- | --- |
| `H01` | OPEN: de meest gestelde vraag, letterlijk (v6) | Volledige video met body en CTA |
| `H02` | OPEN: dezelfde vraag anders verwoord, of het tweede bezwaar (v6) | Volledige video met dezelfde body en CTA |

**Hook 1:** OPEN (v6). Visuele hook H01: na de hook.
**Hook 2:** OPEN (v6). Visuele hook H02: na de hook.
**Body (spreektekst):** OPEN (v6, het antwoord van de klant). Structuur: `<kort antwoord>. <waarom>. <wat de klant dan doet>.`
**Tekst bovenaan:** OPEN: de vraag uit v6.
**Einde:** OPEN (h4).
**Woorden:** –

Niet ingevuld: een vraag als "Is een thuisbatterij nog rendabel zonder premie?" staat in de briefing alleen als voorbeeld
voor posts (r. 393), niet als vraag van klanten van de klant, en het antwoord van de klant is onbekend.

### Dia-versie (kick-offdeck, deel 3)

| Titel | Format | Spreektekst | Tekst in beeld | Vlag | Akkoord |
| --- | --- | --- | --- | --- | --- |
| Hun meest gestelde vraag | Vraag & antwoord, persoon in beeld | Nog in te vullen na antwoord op v6 | – | Open: wie spreekt? | ja / nee |

---

## Open vragen

- [ ] v5: Waarom kiezen klanten voor de klant en niet voor een concurrent? (nodig voor S2)
- [ ] v6: De meest gestelde vragen of bezwaren vóór ze tekenen, en het antwoord van de klant. (nodig voor S3 en voor 3 van de 6 hooks, deckregel 8)
- [ ] v7a/v7c: 12 zonnepanelen + thuisbatterij 10 kWh voor ongeveer €7.000: klopt dat? Incl. btw, voor of na premie? (S1; Thibo bevestigt de prijs)
- [ ] v7b/v7d: Mogen we de voornaam van de bewoner noemen? (S1)
- [ ] v8: Wie staat voor de camera, wie spreekt de voice-over: iemand van de klant, de bewoner, of een acteur? (alle scripts)
- [ ] v9: Shootdatum bij de installatie; is ze al geplaatst of wordt ze nog geplaatst? (beeld S1–S3)
- [ ] v4: Loopt er een promotie of premie met einddatum? (kan S1 of S2 kleuren)
- [ ] h2/h4: je of u, en waar gaat de kijker naartoe (calculator, offerte, afspraak)? (einde van alle scripts)

## Zelfcontrole

Naast `video-agent/BRIEFING.md` en `SKILL.md` §6:

| Regel | Stand |
| --- | --- |
| Opbouw zoals BRIEFING.md (titel + FORMAT, Format, Beeld, Spreektekst/Voice-over, Tekst in beeld, Eindtekst) | voldoet voor S1; S2 en S3 hebben dezelfde opbouw met OPEN-velden |
| 1. Elk feit → briefingveld | voldoet: S1 bevat alleen v7a, v7b (optioneel) en v7c. "Panels" is gelezen als zonnepanelen (interpretatie, te bevestigen in v7a) |
| 2. Bedrag met "ongeveer"/"vanaf" | voldoet: "ongeveer 7.000 euro" en "Ongeveer €7.000", zoals de bron ("about €7k"). Btw/premie niet genoemd: onbekend |
| 3. Promotie alleen met einddatum | voldoet: geen promotie gebruikt (v4 onbekend) |
| 4. Geen review, resultaat, garantie of cijfer zonder bron | voldoet: geen besparing, terugverdientijd, reviews of "geplaatst in 1 dag" |
| 5. Ontbrekend veld → open vraag | voldoet: S2 (v5) en S3 (v6) niet ingevuld, vragen staan erbij |
| 6. Lengte 30–38 woorden, 2 hooks + visuele hook, 3 formats | S1 voldoet (30–34 woorden, 2 hooks met visuele hook); S2/S3 open; 3 verschillende formats wel gekozen |
| 7. Namen van particulieren alleen met akkoord | voldoet: de voornaam alleen als variant na v7d = ja |
| Vlag klant/acteur | open (v8) voor alle drie |
| Deckregel 8 (3 hooks uit klantvragen) | open: alle hooks van S1 komen uit de prijsvraag van de werf, niet uit v6 |
| Aanspreekvorm | concept in "je" (zoals BRIEFING.md); te bevestigen (h2) |

Conclusie: S1 kan naar Thibo (prijs nakijken) en in de kick-off als ja/nee-dia. S2 en S3 kunnen pas geschreven worden na
de onboardingcall (v5, v6); daarna een `scripts_v2.md`, deze versie blijft staan.
