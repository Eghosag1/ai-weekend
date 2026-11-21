# 06 Nieuwe klant in een commando (taak 14)

Lees eerst `../CLAUDE.md`.

## Doel
Een commando, bv. "nieuwe klant Laverra, fee 1910, contact Alec", dat eerst toont wat het gaat aanmaken (droge run) en na ja klaarzet:
Wrike-ruimte uit het template, Strilio-account, klant in Client Check, Meta-koppeling, welkomst- en kick-offmail als concept met de
boekingslink "30 min met Gini", kick-off in de agenda en de scriptbriefing. Gini kijkt na en verstuurt.

## Bron in de briefing
Sectie "14 · New client in one command" (analyse van Dries op 5 Looms van Gini: Gmail 38%, Wrike 24%, Frame.io 9%) en de vijf
vervolgautomatiseringen (ochtendoverzicht, Wrike bijhouden, mails uit templates, videofeedback in Frame.io, research).
Open: Yuki (contract, herfacturatie) niet onderzocht.

## Wat al bestaat
- ClientsCheck MCP `create_client` (controle op gelijkaardige klant) en `qwilr-webhook` (automatisch bij getekend voorstel).
- Vault `strilio-write` (droge run + goedkeuringszin), `wrike-run` (`createTask`), `google-run` (agenda, Gmail).
- ClientsCheck `meta-oauth-start`, `client-onboarding`: Meta-koppeling.
- Onboardingmodule (schema `onboarding`): dossier + herinneringen.
- Ochtendlijst van de copilot (`copilot-morning`), nu alleen voor `COPILOT_ACCOUNT_MANAGERS` (standaard Wannes).

## Wat je bouwt
- [ ] Het commando als skill met droge run en een duidelijk ja-moment.
- [ ] Wrike-ruimte uit "Onboarding + first 100 days" met de standaardtaken.
- [ ] Strilio-account + Client Check-klant + Meta-koppeling + onboardingdossier, idempotent.
- [ ] Welkomst- en kick-offmail als concept met boekingslink, geen getypte tijden.
- [ ] Kick-off in de agenda + scriptbriefing klaargezet (start van 02).
- [ ] Qwilr-webhook en commando worden dezelfde flow (automatisch of met de hand gestart).
- [ ] Standaarden vastleggen: klantcodes, onboardingstappen, feedbackpunten voor editors.
- [ ] Backlog (later): ochtendoverzicht Gini via de bestaande ochtendlijst, Wrike bijhouden, mailtemplates, Frame.io-feedback met automatische check (ondertitels, kleur, voorbeeldprijs, greenscreen), research via Client Check en Answered, Yuki.

## Klaar als
- Een testklant staat met een commando in alle systemen; een tweede run toont "bestaat al" en maakt niets bij.
- Geen mail vertrekt zonder Gini; eigenaar en boekingslink kloppen.

## Werk in
Skill in deze map (`skill/`); roept bestaande functies aan in `ClientsCheck` en `red-pepper-connector-vault`.

## Open vragen
- Toegang tot het Wrike-template.
- Claude-account voor Gini met Gmail, Drive/Calendar, Wrike, Slack, Frame.io (Composio).
- Yuki.
