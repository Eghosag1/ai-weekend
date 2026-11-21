# Scriptbriefing – Testklant Zon – v1

> Testrun van de scriptbot met een anonieme testklant (beslist 21/11): alleen de cijfers uit het voorbeeld in de briefing,
> geen echte klantgegevens. Met de hand opgesteld volgens `../../skill/scriptbriefing-sjabloon.md`, alleen uit bronnen.
> Er is nog geen onboardingcall: wat de briefing zegt, staat op `te bevestigen`.

- Datum: 2026-11-21
- Opgesteld door: Claude (testrun scriptbot)
- Bronnen:
  - [B] `00-bronnen/briefing-wannes-2026-11-21.md`, r. 64 (*Short onboarding call*): voorbeeld van een werf met
    12 panelen + 10 kWh-batterij, "what does that cost today, about €7k".

| # | Veld | Waarde | Bron | Status |
| --- | --- | --- | --- | --- |
| 0a | Klant (naam zoals in beeld) | Testklant Zon (fictief) | – | testklant |
| 0b | Klantcode | TEST (werkcode voor de bestandsnamen) | – | testklant |
| 0c | Website | onbekend | – | onbekend |
| v1 | Aanbod en focus | onbekend (het werfvoorbeeld gaat over panelen + thuisbatterij; of dat de focus is, staat nergens) | – | onbekend |
| v2 | Niet promoten | onbekend | – | onbekend |
| v3 | Prijsvork bij een gemiddelde klant | onbekend | – | onbekend |
| v4 | Promotie of premie + einddatum | onbekend | – | onbekend |
| v5 | USP's | onbekend | – | onbekend |
| v6 | Vragen en bezwaren (+ antwoord) | onbekend | – | onbekend |
| v7a | Werf: wat | 12 panelen + thuisbatterij van 10 kWh ("panels" gelezen als zonnepanelen) | [B] r. 64 | te bevestigen |
| v7b | Werf: waar | bij een klant thuis; gemeente onbekend | [B] r. 64 | te bevestigen |
| v7c | Werf: prijs | "wat kost dat vandaag, ongeveer 7k" → ongeveer €7.000; btw/premies inbegrepen: onbekend | [B] r. 64 | te bevestigen |
| v7d | Naam/plaats noemen | onbekend | – | onbekend |
| v8 | Wie in beeld | onbekend | – | onbekend |
| v9 | Shootdata | onbekend | – | onbekend |
| v10 | Regio | onbekend | – | onbekend |
| h1 | Huisstijl | onbekend (komt van de website van de klant) | – | onbekend |
| h2 | Aanspreekvorm en toon | onbekend | – | onbekend |
| h3 | Schrijfwijze, verboden woorden | onbekend (geen klantbrein; algemene lijst in `video-agent/VIDEO AGENT/config/teksten.json`) | – | onbekend |
| h4 | CTA en bestemming | onbekend | – | onbekend |
| h5 | Bestaand beeldmateriaal | onbekend (geen klantmap in video-agent) | – | onbekend |

Niet overgenomen, bewust:
- "12 panelen en een thuisbatterij van 10 kWh in Maasmechelen … Geplaatst in 1 dag." (briefing r. 386) is voorbeeldtekst
  voor een realisatiepost, geen feit van deze klant.

## Open vragen

- [ ] v1: Als we maar één product mochten promoten de komende maanden, welk is dat? Zonnepanelen met thuisbatterij? (kick-off-agent, toegangsmail)
- [ ] v2: Zijn er dingen waar jullie geen leads voor willen? (idem)
- [ ] v3: Wat kost dat product ongeveer bij een gemiddelde klant? (idem)
- [ ] v4: Lopen er acties of premies, en tot wanneer? (idem)
- [ ] v5: Waarom kiezen klanten voor jullie en niet voor een concurrent? (idem; nodig voor S2)
- [ ] v6: Wat zijn de meest gestelde vragen of bezwaren vóór ze tekenen, en wat antwoorden jullie dan? (idem; nodig voor S3)
- [ ] v7a–c: Klopt het: 12 zonnepanelen en een thuisbatterij van 10 kWh, ongeveer €7.000? Incl. btw? Voor of na premie? (Thibo bevestigt de prijs)
- [ ] v7b/v7d: In welke gemeente, en mogen we de voornaam van de bewoner en de gemeente noemen in de video? (idem)
- [ ] v8: Wie staat voor de camera: de bewoner, iemand van de klant, of een acteur? (idem)
- [ ] v9: Twee shootdata in de komende twee weken. (idem)
- [ ] v10: Regio('s) voor de leads. (idem)
- [ ] 0c: Website van de klant (voor de huisstijl). (idem)
- [ ] h2/h4: je of u? Waar gaat de kijker naartoe: calculator, offerteformulier, afspraak? (accountmanager)
