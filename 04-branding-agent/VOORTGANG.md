# Voortgang 04-branding-agent

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan.

## Status
Analyse klaar (`ANALYSE.md`), architectuur en bouwvolgorde in `CLAUDE.md`. Nog niets gebouwd.
Stap 1 tot 4 gebouwd voor Loni Bouw: analyse, richtingen A/B/C met stijlkaart, 3 posts per richting (B = favoriet van Eghosa).
Volgende: posts in het portaal (campagne "Opstart"), dan stap 6 (nieuwsbrief).

## Logboek
- 2026-11-21 (sessie 4, vervolg): v5 "goede richting, nog veel lege ruimte". Regel 7: lege ruimte = grotere foto's en/of tekst,
  nooit opvullen. Proef v6 (`B/proef/v6/`).
- 2026-11-21 (sessie 4, vervolg): v4 "richting goed maar moet beter"; Loni gebruikt geen afgeronde hoeken. Regel 6 in
  `15_BRANDING.md`: referentie = richting, huisstijl = vorm. Proef v5 (`B/proef/v5/`): rechte hoeken, verloop, mensen uit hun vlak.
- 2026-11-21 (sessie 4, vervolg): nieuw proces (Eghosa): eerst screenshots van posts die bij de klant passen, daaruit alle
  uitingen. Eén richting per klant (geen A/B/C meer). Pakket: post, review, carrousel, nieuwsbrief, Facebook-banner,
  profielfoto, videostijl (5 clips = 1 video), calculator, brandingpresentatie, huisstijl in Client Check.
  Referentie 01 (bankposts: afgeronde blauwe vlakken, uitgeknipte mensen, icoontegels) in `Loni Bouw/huisstijl/referenties/`.
  Uitsnedes uit de werfshoot met `onderwerpmasker` (foto's van de site te klein). Proef v4 in `B/proef/v4/`.
- 2026-11-21 (sessie 4, vervolg): proef v2 afgekeurd ("shit"). Correcties van Eghosa: niet "ingetogen" (proef v3 van de
  realisatie was goed), en geen vaste templates: per klant eigen posts vanuit hun huisstijl, fantaseren mag. Regels en
  geheugen bijgewerkt. Proef v3 Loni Bouw met de dakvorm uit het logo als beeldidee (`B/proef/v3/`: post, review, carrousel).
- 2026-11-21 (sessie 4, vervolg): algemene feedback op de posts (geen logo behalve eindslide, niet altijd titel + zin, geen
  AI-slop, geen voetregel, variatie in layout en kleur) vastgelegd in `15_BRANDING.md` en `13_SOCIALPOSTS.md`, met de
  interpretatie van zijn visuele keuzes; ook in het geheugen van Claude. Proef v2: post (donker), review (wit), carrousel
  (randloze cover, witte slides, donkere eindslide met logo) als PNG's in `Loni Bouw/huisstijl/B/proef/v2/`.
- 2026-11-21 (sessie 4, vervolg): posts v2 "zien er echt niet goed uit" (Eghosa). Oorzaak: advertentiemotor (knop, kicker,
  feiten, vakken) en geen idee per post. Referentie: socialstatics FM/ABBI van 18/11 (sessiemap; de echte posts staan op de
  andere laptop, Eghosa zoekt ze). Nieuwe redactionele stijl als proef in `Loni Bouw/huisstijl/B/proef/` (commit `6142baaa`):
  idee + titel zwaar/licht, haarlijn-kicker, grote foto met detailcirkel, signatuur logo + voetregel, geen knop.
  Realisatie "Plat dak. Vol licht." goed bevonden als richting; daarna review en carrousel (5 slides) in dezelfde stijl.
- 2026-11-21 (sessie 4, vervolg): Eghosa vond de posts "wat simpel". Templates v2 volgens de 16 feedbackrondes op Floors & More
  (klantbrein §2): overlappende vlakken, detailfoto over de hoofdfoto, titel licht/zwaar, lijnkader achter de foto, genummerde
  punten. Review zonder kicker (aanhalingsteken als teken). Alle 9 posts IN ORDE (`<richting>/posts_v<N>_t2/`).
- 2026-11-21 (sessie 4, vervolg): stap 4 in video-agent (commit `e9b6b729`): `tools/brandingposts.py`: realisatie, review,
  expertvraag (feed 4:5) op de bouwstenen en controle van `statics.py`, met een vertaler huisstijl → statics-stijl. Inhoud
  Loni Bouw in `huisstijl/posts_inhoud.json`, alleen echte bronnen: foto's van de site, getuigenis van de site ("Fijn overleg
  en slimme ideeën. Dat geeft vertrouwen."), vraag en punten uit het goedgekeurde script 3. Alle 9 posts IN ORDE.
  Eerste render afgekeurd op tekstgrootte (min. 45 px): teksten vergroot.
- 2026-11-21 (sessie 4, vervolg): stap 3 in video-agent (commit `7605414f`): `huisstijl.py kaart` (stijlkaart 1080x1350:
  postvoorbeeld op een echte foto, kleuren, fonts, knoppen, motief). Loni Bouw: B (donker, kapitalen) en C (logo als bron:
  dakmotief, logoblauw, titels 900); overzicht `huisstijl/overzicht_2026-11-21.png`. Stijlkaarten (PNG) staan niet in git
  (.gitignore), wel te maken uit de JSON.
- 2026-11-21 (sessie 4, vervolg): stap 2 gebouwd in video-agent (`~/Desktop/video-agent`, commit `6232945d` op main; alleen de
  eigen bestanden gecommit, het andere videowerk niet aangeraakt): `tools/merkanalyse.py` (meting website: kleuren, fonts,
  radius, logo, socials, koppen, CTA's + screenshots), `tools/huisstijl.py` (controle, start, nieuw, lijst, css; versies als
  `v<N>.json`, nooit overschreven), `templates/klant/huisstijl.json`, `15_BRANDING.md`, skill `branding`. Test op Loni Bouw:
  `huisstijl/analyse.md`, `A/v1.json`, `A/v2.json` (logokleuren gemeten: #27A5DE en #A9AAAF; klantbrein had schattingen).
  Gevonden: Instagram-link op de site is van de webbouwer (Elmedia), niet van Loni Bouw.
- 2026-11-21 (sessie 4): stap 1 gestart. Stijlbestanden gelezen (`stijl.json`, `tekststijlen.json`, `config/motion.json`,
  `_social/abbi_stijl.py`, klantbrein Loni Bouw §2-3, mail-bot `KLANTBREIN.md`/`STIJL.md`, calculator `perf-calculator`).
  Voorstel: één `huisstijl.json` per klant en richting, met vertalers naar de bestaande bestanden.
- 2026-11-21 (sessie 3): nieuwe briefing van Eghosa (`00-bronnen/briefing-branding-2026-11-21.md`). Werkmap opgeruimd: alleen
  de branding agent blijft (andere mappen, `_thibo`, `scripts`, bouwspecificatie en bouwplan verwijderd; laatste stand met alles:
  `f482e06`). Vier onderzoeksagents (alleen lezen) op portaal, Client Check, video-agent + mail-bot, Strilio + Vault + nachtploeg.
  Analyse in `ANALYSE.md`, architectuur en fasen in `CLAUDE.md`. Kloons van video-agent bekeken: `~/Desktop/video-agent` is de
  echte werkkopie (videojobs, worktrees, launchd `be.redpepper.feedbackronde`); `~/Developer/video-agent` is een schone kopie op
  dezelfde commit (`2d391085`) zonder eigen branches of stashes.
- 2026-11-21 (sessie 2): paden in CLAUDE.md gecorrigeerd (alles onder `video-agent/VIDEO AGENT/`). Afspraak met Thibo genoteerd.
- 2026-11-21: map aangemaakt met context uit het bouwplan.

## Beslissingen
- 2026-11-21: één stijlrichting per klant, vanuit screenshots die Eghosa aanlevert (Eghosa). Banners: alleen Facebook. Videostijl en calculator horen bij het pakket. Nieuw: Facebook-banner en profielfoto.
- 2026-11-21: geen vaste posttemplates voor alle klanten; per klant eigen ontwerp vanuit de huisstijl (Eghosa). `tools/brandingposts.py` vervalt als aanpak.
- 2026-11-21: de vaste uitingen per stijl in de brandingpresentatie: post (realisatie), review en carrousel (expertvraag) (Eghosa).
- 2026-11-21: postsstijl = redactioneel zoals de proef realisatie_proef_v3 (Eghosa: "eigenlijk niet slecht"); de templates v1/v2 vervallen.
- 2026-11-21: Loni Bouw: stijl B is de favoriet van Eghosa; posts eerst in B (de klant kiest in de meeting).
- 2026-11-21: repo op GitHub hernoemd naar `Eghosag1/creatieve-motor` (oude adres stuurt door); lokale mappen ongewijzigd (Eghosa: ja).
- 2026-11-21: analyse en richting A Loni Bouw goedgekeurd; ideeën B en C goedgekeurd; naam "creatieve motor" voorgesteld (Eghosa).
- 2026-11-21: formaat huisstijlbestand goedgekeurd; alles wat creatief is komt in video-agent (Eghosa).
- 2026-11-21: videostijl = 5 testclips die samen 1 video vormen (Eghosa).
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
- Loni Bouw: echte Google-review (met sterren en voornaam), gemeente/oppervlakte/doorlooptijd van de realisatie (`posts_inhoud.json`, veld open).
- Brandingposts mogen een klein logo dragen? De statics-regel verbiedt een logo-overlay (advertenties); voor organische posts misschien anders.
- Eigen Instagram van Loni Bouw: bestaat die? (link op de site is van de webbouwer)
- Welke testklant precies? Voorstel: Loni Bouw (recent, websitepagina's al bewaard, ook `projectcalculator.html`).
- Formaat en plek van het huisstijlbestand in video-agent (voorstel volgt bij fase 1).
- Instagram analyseren: zonder koppeling alleen via screenshots of de publieke pagina. Volstaat dat?
- Calculator: template-repo `Office-omgeving/calculator-energiedekempen` niet gekloond; volstaat de kopie van de nachtploeg?
- Huisstijl in Client Check: nieuwe tabel met versies, of `clients.branding` (jsonb, ongebruikt) hergebruiken? `brand_color_*`
  en `logo_url` zijn van Onboarding OS: meeschrijven of niet? (beslissen bij fase 3, met Dries)
- Wrike: in welke map komt de taak "huisstijl vastleggen", en wat betekent NN in de titel?
- Homepage-herontwerp voor maand 3 (oorspronkelijke briefing): binnen de branding agent of later?
- Bestaande klanten (ABBI, Floors & More, Janssen & Janssen): huisstijl later ook in Client Check zetten?
