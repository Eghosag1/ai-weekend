# 04 Branding agent (taak 11)

Lees eerst `../CLAUDE.md`.

## Doel
Per nieuwe klant de merkstijl analyseren en drie stijlroutes maken, elk met de drie posttemplates (realisatie, review, expertvraag)
en een nieuwsbrief, plus de montagestijl op vijf testclips en een calculatorontwerp. De klant kiest in de brandingmeeting;
die route wordt de vaste huisstijl voor alles. Eghosa leidt de meeting.

## Bron in de briefing
Sectie "11 · Branding agent": wat het doet, kwaliteit (geen AI-slop, lat = Floors & More), hoe het aansluit (6 gratis posts over 3 maanden,
pakket 500 euro voor 9 posts + nieuwsbrief, normaal ongeveer 2.000), outline brandingmeeting (11 dia's, ongeveer 45 min),
de 3 posttemplates met vaste velden, alternatieven voor post 4 tot 6, gratis nieuwsbrief in maand 2 voor klanten zonder pakket.

## Wat al bestaat
- `video-agent`: klantbrein per klant met huisstijl uit de website (`templates/klant/00_KLANTBREIN.md`, `06_MONTAGEPROFIEL.md` §11), socialposts (`13_SOCIALPOSTS.md`, `tools/posts.py`), statics (`07_STATICS.md`, `tools/statics.py`), montage en captions, nieuwsbrieven als soort `mail` (`14_MAILS.md`).
- `mail-bot`: stijlronde met varianten op een keuzepagina, klant kiest, bouwdoos (`templates/STIJL.md`); stijl vastgelegd na klantakkoord.
- `revenuelab-portaal`: review, klantlink, akkoord.
- Strilio: nieuwsbrieven versturen met klikmeting en afmelden.

## Wat je bouwt
- [ ] Stijlronde voor drie routes tegelijk, voor de drie templates (realisatie, review, expertvraag).
- [ ] Vaste velden per template: realisatie (gemeente, installatie, aantal/capaciteit, doorlooptijd, optionele prijs, liefst voor/na); review (echte Google-review, sterren, voornaam, probleem, oplossing, resultaat); expertvraag (vraag uit intake vraag 6 of salescalls, 20 s of carousel).
- [ ] Varianten voor post 4 tot 6: echte promo met einddatum, team, mijlpaal.
- [ ] 5 testclips per montagestijl + calculator- of website-element per route.
- [ ] Keuzepagina in het portaal voor de meeting; gekozen route vastleggen als VASTGELEGD, ook in de videobot en de mailbot.
- [ ] Kernfeiten van de huisstijl (kleuren, fonts, toon, status) ook in het klantbrein van Client Check, zodat andere agents ze lezen.
- [ ] Template brandingmeeting (11 dia's) volgens de 17 deckregels.
- [ ] Contentkalender 6 gratis posts; pitch + kort verkoopscript pakket.
- [ ] Gratis nieuwsbrief week 6 tot 7 voor klanten zonder pakket; opens, kliks, reacties voor de maand-2-meeting.
- [ ] Nooit verzonnen reviews of claims.

## Klaar als
- Voor een testklant staan 3 routes x 3 posts, een nieuwsbrief, 5 testclips en een calculatorontwerp in het portaal.
- Na de keuze kan elk template opnieuw gevuld worden met een foto en drie feiten, zonder stijlbreuk.

## Werk in
`video-agent`, `mail-bot`, `revenuelab-portaal` (let op de regels voor Client Check in hun CLAUDE.md).

## Open vragen
- Homepage-herontwerp voor maand 3 (branding agent bouwt, Eghosa polijst): nu of later (D2)?
- Een huisstijl voor video en mail samen: overgang voor ABBI, Floors & More, Janssen & Janssen.
