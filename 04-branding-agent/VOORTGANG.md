# Voortgang 04-branding-agent

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan.

## Status
Analyse klaar (`ANALYSE.md`), architectuur en bouwvolgorde in `CLAUDE.md`. Nog niets gebouwd.
Volgende stap: fase 1 (formaat huisstijlbestand + merkanalyse), testklant Loni Bouw.

## Logboek
- 2026-11-21 (sessie 3): nieuwe briefing van Eghosa (`00-bronnen/briefing-branding-2026-11-21.md`). Werkmap opgeruimd: alleen
  de branding agent blijft (andere mappen, `_thibo`, `scripts`, bouwspecificatie en bouwplan verwijderd; laatste stand met alles:
  `f482e06`). Vier onderzoeksagents (alleen lezen) op portaal, Client Check, video-agent + mail-bot, Strilio + Vault + nachtploeg.
  Analyse in `ANALYSE.md`, architectuur en fasen in `CLAUDE.md`. Kloons van video-agent bekeken: `~/Desktop/video-agent` is de
  echte werkkopie (videojobs, worktrees, launchd `be.redpepper.feedbackronde`); `~/Developer/video-agent` is een schone kopie op
  dezelfde commit (`2d391085`) zonder eigen branches of stashes.
- 2026-11-21 (sessie 2): paden in CLAUDE.md gecorrigeerd (alles onder `video-agent/VIDEO AGENT/`). Afspraak met Thibo genoteerd.
- 2026-11-21: map aangemaakt met context uit het bouwplan.

## Beslissingen
- 2026-11-21: alleen de branding agent; de rest uit de werkmap (Eghosa).
- 2026-11-21: architectuur zoals in `CLAUDE.md`: Client Check = goedgekeurde huisstijl, portaal "Opstart" = werkplaats,
  video-agent = productie, één huisstijlbestand per klant en stijlrichting (Eghosa: "klinkt goed").
- 2026-11-21: Eghosa bewerkt via Claude (Claude Code of de extensie in VS Code) op de bronbestanden; elke aanpassing = nieuwe
  versie met label "handmatig". Geen bewerken in het portaal zelf (besluit 17/11 "alles met de bot" blijft).
- 2026-11-21: stijlrichtingen: A dicht bij het huidige merk, B en C gedurfder binnen het eigen logo en de eigen kleuren.
- 2026-11-21: brandingpresentatie als HTML-template die zich vult, export naar PDF (geen Google Slides).
- 2026-11-21: testen met een recente klant die al een klantmap in video-agent heeft; echte gegevens blijven in video-agent.
- 2026-11-21: video-agent: alleen de kloon op het bureaublad (`~/Desktop/video-agent`) blijft; de schone kopie in
  `~/Developer/video-agent` is verwijderd (gecontroleerd: geen wijzigingen, stashes, eigen commits of worktrees).
- 2026-11-21: mail-bot als map in video-agent opnemen: uitgesteld, niet nodig voor fase 1.
- 2026-11-21: taak 11 is volledig van Eghosa; de nachtploeg bouwde er niets inhoudelijks voor.

## Open vragen
- Welke testklant precies? Voorstel: Loni Bouw (recent, websitepagina's al bewaard, ook `projectcalculator.html`).
- Formaat en plek van het huisstijlbestand in video-agent (voorstel volgt bij fase 1).
- Instagram analyseren: zonder koppeling alleen via screenshots of de publieke pagina. Volstaat dat?
- Calculator: template-repo `Office-omgeving/calculator-energiedekempen` niet gekloond; volstaat de kopie van de nachtploeg?
- Huisstijl in Client Check: nieuwe tabel met versies, of `clients.branding` (jsonb, ongebruikt) hergebruiken? `brand_color_*`
  en `logo_url` zijn van Onboarding OS: meeschrijven of niet? (beslissen bij fase 3, met Dries)
- Wrike: in welke map komt de taak "huisstijl vastleggen", en wat betekent NN in de titel?
- Homepage-herontwerp voor maand 3 (oorspronkelijke briefing): binnen de branding agent of later?
- Bestaande klanten (ABBI, Floors & More, Janssen & Janssen): huisstijl later ook in Client Check zetten?
