# 04 Branding agent

Lees eerst `../CLAUDE.md`. Briefing: `../00-bronnen/briefing-branding-2026-11-21.md`. Analyse van wat bestaat: `ANALYSE.md`.

## Doel
Voor elke nieuwe klant: de bestaande merkidentiteit analyseren, drie stijlrichtingen uitwerken (elk 3 Instagram-posts en een
nieuwsbrief), een videostijl met 5 testclips, een (werkende) calculator in hun huisstijl, en alles samenbrengen in een
brandingpresentatie van 11 dia's (±45 min). De klant kiest in de meeting; die stijl wordt de huisstijl in het klantbrein van
Client Check, waar de videobot en later de Opportunities Agent ze lezen. Kwaliteitslat: Floors & More. Eghosa keurt alles goed.

## Architectuur (voorstel 21/11, goedgekeurd in grote lijnen)

Elk systeem doet wat het al doet:

| Systeem | Rol |
| --- | --- |
| Client Check | Eindpunt: de goedgekeurde huisstijl, met versies (voorstel → bevestigd, actieve versie). Andere agents lezen alleen hier (MCP-leestool). |
| Portaal, campagne "Opstart" | Werkplaats: alle concepten, versies, opmerkingen met pins, goedkeuring per item, presentatie. |
| video-agent (+ mail-bot) | Productie: merkanalyse, posts (HTML → PNG), nieuwsbrief (bouwdoos), clips, calculator, presentatie. |
| Wrike | Taak "huisstijl vastleggen" voor Eghosa; aanbod van Wannes voor de calculator (de agent leest die taak zelf). |

**De kern: één huisstijlbestand per klant en per stijlrichting** (kleuren, fonts, logo, vormen, toon, captions, animaties,
beeldregels). Posts, nieuwsbrief, clips, calculator en presentatie lezen allemaal hetzelfde bestand. Drie stijlrichtingen =
drie bestanden. Na de meeting wordt het gekozen bestand de huisstijl in Client Check.

**Creatieve controle:**
- Eghosa past aan via Claude (Claude Code of de extensie in VS Code) op de bronbestanden; elke aanpassing wordt een nieuwe
  versie met het label "handmatig". Opmerkingen met pins in het portaal kunnen ook.
- De agent werkt altijd verder op de laatste versie, ook als die handmatig is; nooit opnieuw vanaf zijn eigen oudere versie.
- Terughalen = een oudere versie opnieuw opleveren als nieuwe versie. Opgeleverde versies worden nooit overschreven (portaal).

**Stijlrichtingen:** A blijft dicht bij het huidige merk; B en C zijn gedurfder, maar met hun eigen logo en kleuren.

**Presentatie:** vaste HTML-template van 11 dia's die zich vult met de goedgekeurde versies uit Opstart, export naar PDF.

**Start bij een nieuwe klant (v1):** geen databasetrigger in Client Check (tabel gedeeld door vier apps). De agent controleert
"welke klanten hebben nog geen Opstart?" en stelt de Wrike-taak voor; aanmaken via `wrike-run` na de goedkeuringszin.

## Bouwvolgorde

| Fase | Wat | Raakt |
| --- | --- | --- |
| 1 | Formaat huisstijlbestand + merkanalyse (skill). 3 stijlrichtingen × 3 posts met vaste templates (realisatie, review, expertvraag). In een campagne "Opstart" met de soorten die het portaal al kent (static, carrousel). | video-agent |
| 2 | Nieuwsbrief per stijlrichting (bouwdoos mailbot), 5 testclips per stijl, calculator vanuit het sjabloon van de nachtploeg (demo voor de meeting; werkend zodra het aanbod van Wannes er is). | video-agent (+ mail-bot) |
| 3 | Brandingpresentatie HTML/PDF die zich vult. Huisstijl in Client Check: tabel met versies + MCP-leestool, als migratiescript dat Eghosa draait. | video-agent, ClientsCheck (script) |
| 4 | Portaal: HTML-weergave, veld stijlrichting, veld herkomst (AI/handmatig), keuzepagina. Wrike-taak bij nieuwe klant. Daarna: Strilio-nieuwsbrief, 6 gratis posts, Opportunities Agent. | revenuelab-portaal, Vault |

## Vaste velden per posttemplate (oorspronkelijke briefing §11)
- Realisatie: gemeente, installatie, aantal/capaciteit, doorlooptijd, optionele prijs, liefst voor/na.
- Klantreview: echte Google-review, sterren, voornaam, probleem, oplossing, resultaat. Nooit een verzonnen review.
- Expertvraag: vraag uit intake vraag 6 of salescalls; 20 s of carrousel.

## Klaar als (fase 1 tot 3)
- Voor de testklant staan in Opstart: merkanalyse, 3 stijlrichtingen × 3 posts, een nieuwsbrief per stijl, 5 testclips, een
  calculatordemo en een brandingpresentatie (PDF), elk afzonderlijk goed te keuren.
- Na de keuze staat de huisstijl in Client Check en kan elk template opnieuw gevuld worden met een foto en drie feiten, zonder stijlbreuk.
- Geen enkele handmatige aanpassing van Eghosa is door de agent overschreven.

## Open vragen
Zie `VOORTGANG.md`.
