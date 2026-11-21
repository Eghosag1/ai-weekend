# Bouwplan: samenvatting

Volledig bouwplan (analyse van alle repo's, plan per onderdeel, architectuur, controleoverzicht):
https://claude.ai/artifact/KoYeivDi6XK59rAKrGVssQ

## Kern

- Ongeveer de helft van wat gevraagd wordt, bestaat al in code. Het werk is vooral samenvoegen en aanvullen.
- Client Check is het klantbrein. Strilio is de motor voor opvolging en flows. Videobot + mailbot + portaal doen het creatieve werk.
  Alles naar buiten loopt via de Connector Vault of de nachtploeg, na akkoord.
- Drie versies van de briefing: bijlage A in de PDF (oudst), een tweede versie, en die van 21/11 (nieuwst, staat hier in `00-bronnen`).

## Open beslissingen (blokkerend)

| # | Vraag | Voor wie | Voorstel |
| --- | --- | --- | --- |
| D1 | Mag de 24-uursmail automatisch naar de klant? Nu verstuurt alleen Romina klantmails. | Wannes, Thibo | Eerst 2 tot 3 weken als concept in Vandaag |
| D2 | SEO/GEO-analyse en homepage-herontwerp (maand 3) nu of later? | Wannes | Later, eigen opdracht |
| D3 | Wat moet maandag 23/11 te tonen zijn? | Wannes | Scriptbot, briefing check, eerste versie nieuwe-klantcommando |
| D4 | Strilio-inrichting in `strilio-write` (Vault) of als beheertools in de Strilio-MCP? | Dries, Eghosa | Vault (droge run + goedkeuringszin bestaan al) |
| D5 | Strilio-standaardflows aanpassen aan de briefing (voicemail 2/4 naar WhatsApp, offerte na 3 weken) of bestaande set houden? | Wannes, Dries | Bestaande set + briefingvariant per klant |

## Andere open punten

- Strategiesessie elke 16 weken of elk kwartaal (de briefing zegt beide).
- Prijzen maand 3: staan ingevuld (Answered v2 + website), maar "Wannes to confirm" staat er nog.
- Bouwt Eghosa taak 12 en 15 mee? Briefing: eigenaar Thibo. Bouwspecificatie: "Eghosa: bouwownership en integratie".
- Vanaf wanneer tellen de 120 dagen: verkoop, kick-off of go-live?
- Wie schrijft de ongeveer 10 huisregels voor de briefing check?
- Toegang nodig: Wrike-template "Onboarding + first 100 days", agenda's van Hermann en Eghosa, playbook "Extra's voor klanten",
  Claude-account voor Gini, Qwilr-webhooks.
