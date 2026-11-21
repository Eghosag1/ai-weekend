# Context: Branding Agent voor Revenue Lab

> Briefing van Eghosa, 21/11/2026. Leidend voor deze werkmap. "De oorspronkelijke briefing" hieronder is
> `briefing-wannes-2026-11-21.md` (§11 Branding agent).

Ik wil een nieuwe Branding Agent bouwen binnen ons bestaande Revenue Lab-ecosysteem. Hieronder leg ik uit wat we willen bereiken, hoe we het proces voor ons zien en welke systemen daarbij betrokken zijn.

**Dit is geen technisch stappenplan dat je letterlijk moet volgen.** Ik wil dat je zelf kritisch nadenkt over de beste architectuur, de bestaande codebase onderzoekt en bekijkt hoe we dit zo efficiënt, kwalitatief en schaalbaar mogelijk kunnen realiseren.

## 1. Het doel

Wanneer een nieuwe klant wordt aangemaakt in Client Check, moet automatisch het brandingproces worden opgestart.

Het doel is om voor iedere nieuwe klant een professionele merkidentiteit te analyseren, creatieve uitwerkingen voor te bereiden en uiteindelijk een brandingpresentatie samen te stellen die we tijdens een meeting aan de klant tonen.

AI moet zoveel mogelijk voorbereidend en uitvoerend werk overnemen, maar ik (Eghosa) wil de volledige creatieve controle behouden.

De kwaliteit moet overeenkomen met wat een professionele designer of video-editor zelf zou afleveren. De content van Floors & More is hiervoor een belangrijke kwaliteitsreferentie.

## 2. Hoe we het proces voor ons zien

### Nieuwe klant en Wrike

Wanneer een klant in Client Check wordt aangemaakt, moet er automatisch een taak voor mij in Wrike verschijnen om de huisstijl van die klant vast te leggen.

Tijdens de onboardingcall wordt bepaald welke producten of diensten we voor de klant gaan adverteren.

Wannes zorgt ervoor dat ik via een Wrike-taak de nodige informatie krijg over het aanbod waarvoor we advertenties maken. Deze informatie is vooral belangrijk voor de calculator.

De brandingvoorbereiding moet dus kunnen starten voordat alle onboardinginformatie beschikbaar is.

### Merkanalyse

De Branding Agent onderzoekt de bestaande merkidentiteit van de klant:

- Website en bestaande socialmediakanalen.
- Logo, kleuren en typografie.
- Tone of voice en communicatiestijl.
- Fotografie, beeldgebruik en grafische vormgeving.
- Bestaande content en herkenbare stijlelementen.

Op basis daarvan moet de agent voorstellen kunnen uitwerken die aansluiten bij de identiteit van de klant.

We willen niet zomaar willekeurige nieuwe huisstijlen genereren. De bestaande merkidentiteit vormt het vertrekpunt.

### Creatieve uitwerkingen

Voor iedere klant willen we vier onderdelen voorbereiden.

**1. Instagram-posts**

We willen drie soorten posts:

- Realisatie: een uitgevoerd project tonen.
- Klantreview: vertrouwen opbouwen met een bestaande review.
- Expertvraag: een veelgestelde vraag beantwoorden.

Volgens de oorspronkelijke briefing moeten we deze posts in drie verschillende visuele stijlrichtingen kunnen voorstellen.

**2. Nieuwsbrief**

Een professioneel ontworpen nieuwsbrief die aansluit bij de huisstijl en de voorgestelde stijlrichtingen.

**3. Videostijl**

We willen een herkenbare videostijl voor de klant ontwikkelen en demonstreren aan de hand van vijf testclips.

Denk aan typografie, captions, animaties, kleuren, overgangen en algemene montagevormgeving.

We hebben al een bestaande videobot. Onderzoek of en hoe we die hiervoor kunnen hergebruiken.

**4. Calculator**

Voor iedere klant moet een calculator kunnen worden ontwikkeld die aansluit bij de diensten waarvoor we advertenties maken.

De commerciële inhoud wordt bepaald tijdens de onboardingcall. Wannes bezorgt de nodige informatie via Wrike.

De calculator moet zowel functioneel als visueel aansluiten bij het aanbod en de huisstijl van de klant.

Dit is dus niet uitsluitend een grafische mock-up. We willen uiteindelijk een werkende calculator kunnen maken.

## 3. Manuele controle is essentieel

Alle creatieve uitwerkingen die de agent genereert, moeten door mij bekeken en aangepast kunnen worden.

Ik wil bijvoorbeeld:

- Een Instagram-post manueel kunnen aanpassen.
- Een nieuwsbrief verder kunnen bewerken.
- De videostijl en bijbehorende clips kunnen bijsturen.
- De calculator visueel en functioneel kunnen aanpassen.
- Nieuwe variaties kunnen laten genereren.
- Eerdere versies kunnen behouden en terughalen.

De agent mag mijn manuele aanpassingen niet zomaar overschrijven.

Ieder onderdeel moet afzonderlijk kunnen worden beoordeeld en goedgekeurd.

De AI is dus een creatieve uitvoerder en assistent, niet degene die zelfstandig beslist wat definitief wordt opgeleverd.

## 4. Integratie in ons bestaande portaal

We hebben al een Revenue Lab-portaal waarin we campagnes en creatieve uitwerkingen beheren.

Mijn idee is om bij een nieuwe klant één campagne aan te maken met de naam **'Opstart'**.

Binnen deze campagne kunnen alle brandingonderdelen worden beheerd:

- Merkanalyse.
- Stijlrichtingen.
- Instagram-posts.
- Nieuwsbrieven.
- Videostijl en testclips.
- Calculator.
- Revisies en goedkeuringen.
- Brandingpresentatie.

Dit is mijn huidige idee, geen verplichte technische architectuur.

Onderzoek hoe ons portaal momenteel werkt en of we de bestaande campagnestructuur, reviewfunctionaliteiten en andere componenten hiervoor kunnen hergebruiken.

Ik wil absoluut vermijden dat we functionaliteiten dubbel bouwen of een volledig nieuwe applicatie maken terwijl we al geschikte systemen hebben.

## 5. Automatische brandingpresentatie

Wanneer ik tevreden ben met alle uitwerkingen en ze heb goedgekeurd, moeten we deze kunnen samenbrengen in één professionele brandingpresentatie.

We willen hiervoor een vaste presentatietemplate gebruiken, zodat iedere klant een consistente presentatie krijgt.

De oorspronkelijke briefing voorziet ongeveer 45 minuten voor de brandingmeeting, met deze inhoud:

1. Cover.
2. Analyse van de bestaande merkidentiteit.
3. Stijl A met drie Instagram-posts en nieuwsbrief.
4. Stijl B met dezelfde onderdelen.
5. Stijl C met dezelfde onderdelen.
6. Videostijl met vijf testclips.
7. Calculatorontwerp.
8. Definitieve stijlkeuze door de klant.
9. Planning van zes gratis posts over drie maanden.
10. Voorstelling van het brandingpakket: negen posts en één nieuwsbrief per maand voor €500.
11. Volgende stappen in de onboarding.

De presentatie moet visueel sterk, professioneel en overzichtelijk zijn.

Ik wil niet telkens handmatig een volledige presentatie moeten samenstellen. De goedgekeurde onderdelen moeten zoveel mogelijk automatisch in het juiste template terechtkomen.

## 6. Het klantbrein in Client Check

Dit is een belangrijk onderdeel.

We hebben in Client Check een klantbrein waarin we informatie over klanten bewaren.

**De definitief goedgekeurde huisstijl moet in dit klantbrein worden opgeslagen.**

Denk aan:

- Logo, kleuren en typografie.
- Tone of voice.
- Beeldstijl en grafische richtlijnen.
- Goedgekeurde Instagram-voorbeelden.
- Nieuwsbriefstijl.
- Videostijl en montagevoorkeuren.
- Calculatorstijl en ontwerpcomponenten.

Het klantbrein moet de centrale bron worden voor de merkidentiteit van iedere klant.

Andere agents moeten deze informatie later kunnen gebruiken, waaronder onze videobot en de Opportunities Agent.

Zo vermijden we dat iedere agent opnieuw de huisstijl moet analyseren of zelf moet interpreteren.

De verschillende concepten en revisies kunnen binnen de campagne 'Opstart' blijven bestaan. In het klantbrein willen we vooral de definitieve, goedgekeurde stijl als actieve referentie bewaren.

## 7. Wat er na de brandingmeeting gebeurt

Tijdens de brandingmeeting kiest de klant de definitieve stijl.

Vanaf dat moment moet deze stijl de standaard worden voor toekomstige uitwerkingen.

De oorspronkelijke briefing voorziet daarnaast:

- Zes gratis socialmediaposts, verspreid over de eerste drie maanden.
- Een brandingpakket van €500 per maand met negen posts en een maandelijkse nieuwsbrief.
- Voor klanten die het pakket niet nemen, één gratis nieuwsbrief in maand twee.
- Het tonen van de nieuwsbriefresultaten tijdens de meeting in maand twee.
- Een koppeling met de Opportunities Agent, zodat toekomstige posts, nieuwsbrieven en pop-ups in de vastgelegde huisstijl worden gemaakt.

Dit is relevante context voor de bredere architectuur. Het betekent niet noodzakelijk dat we al deze commerciële opvolging meteen in de eerste versie moeten bouwen.

## 8. Wat ik van jou verwacht

Ik wil dat je eerst onze bestaande projecten en codebases onderzoekt.

We hebben onder andere:

- Client Check met het klantbrein.
- Het Revenue Lab-portaal met campagnes en reviewfunctionaliteiten.
- Wrike voor taakbeheer.
- Een bestaande videobot.
- Mogelijk andere relevante componenten en integraties.

**Ga er niet automatisch van uit dat we nieuwe systemen moeten bouwen.** Onderzoek eerst wat er bestaat, hoe het momenteel werkt en wat we kunnen hergebruiken.

Denk daarbij kritisch na over:

- De verdeling van verantwoordelijkheden tussen de bestaande systemen.
- Hoe de agent aan de juiste klantinformatie komt.
- Hoe we content kwalitatief kunnen genereren én bewerkbaar houden.
- Hoe we versies en goedkeuringen beheren.
- Hoe we de brandingpresentatie het best genereren.
- Hoe we de definitieve huisstijl gestructureerd in het klantbrein bewaren.
- Hoe andere agents de goedgekeurde merkidentiteit kunnen gebruiken.
- Welke onderdelen we het best eerst bouwen en welke later.

Je mag gerust een betere aanpak voorstellen dan degene die ik hierboven beschrijf, zolang je de functionele doelstellingen en mijn creatieve eindcontrole respecteert.

**Belangrijk voor nu:** begin met analyseren en nadenken. Pas nog niets aan in de bestaande projecten.

Ik wil eerst begrijpen wat er al bestaat, welke mogelijkheden we hebben en welke architectuur jij zou aanbevelen.

Geef je bevindingen in duidelijke, menselijke taal. Leg uit wat we kunnen hergebruiken, wat ontbreekt en hoe jij het systeem zou opbouwen. Vermijd onnodig technische uitleg, maar wees technisch grondig in je onderzoek.

Het uiteindelijke doel is één geïntegreerd brandingproces dat zoveel mogelijk werk automatiseert, zonder dat we inleveren op kwaliteit, flexibiliteit of creatieve controle.
