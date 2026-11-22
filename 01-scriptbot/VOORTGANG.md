# Voortgang 01-scriptbot

Bijwerken na elke sessie (datum, wat gedaan, wat open, beslissingen). Nieuwste bovenaan. Het logboek van het vorige ontwerp
(sessies 3-6, 21/11) staat in de git-geschiedenis (commit `3df99f5`).

## Status
Nieuw ontwerp besproken en uitgeschreven in `CLAUDE.md`. Nog niets gebouwd. Wacht op: ja van Eghosa op de bouwvolgorde,
beginnend met stap 1 (woordenlijst montage en scriptformaat).

## Logboek
- 2026-11-22 (sessie 7): brainstorm met Eghosa over een nieuwe scriptbot. Gelezen: het vorige ontwerp, het scriptsjabloon en
  het montageprofiel van de videobot, de MCP van Client Check (OAuth per gebruiker; geen tabel met commerciële feiten:
  `client_facts` is persoonlijk), de koppeling van de videobot met het portaal (`portaal-bot`, eigen sleutel). Gevonden: de
  scriptcommits van het portaal (`74b0f8d` e.a.) staan op GitHub en in `~/Desktop/revenuelab-portaal`, niet in de kloon in
  `~/Developer` (die stond achter). Ontwerp en bouwvolgorde in `CLAUDE.md`; oude inhoud van deze map vervangen.

## Beslissingen (2026-11-22, Eghosa)
- Scripts maken gebeurt in Claude Code; starten in gewone taal, geen `/scriptbot <klant>`.
- Ook latere scripts, met rekening houden met de scripts die de klant al heeft.
- Per take: tekst, filmen, montage; een montagetoevoeging alleen als ze iets bijbrengt.
- Geen take-nummers inspreken door Hermann.
- Klantfeiten niet in het portaal: telkens uit de gesprekken in Client Check halen en dubbelchecken (nieuw, kloppend).
- Geen versies: goedgekeurd in de chat → finaal in het portaal, behalve als de klant opmerkingen heeft.
- Klant ziet alleen de tekst; kan goedkeuren en opmerkingen geven. De regie staat bij het script in het portaal,
  verborgen voor de klant.
- Gebruikers: Hermann en Gini (hebben een account in Client Check en toegang tot Claude Code). Plugin in een eigen repo
  `Red-Pepper-Antwerp/scriptbot`. Aan het einde een standaardprompt die alles voor hen instelt.
- De ±89 oude scripts eenmalig in het portaal als "eerder gebruikt", onzichtbaar voor de klant.

## Open vragen
- Melding voor het team bij opmerkingen of akkoord van de klant (Slack, "Wacht op jou" in het portaal, of later): Eghosa
  denkt erover na.
- Woordenlijst montage: `broll` en `tekstkaart` nakijken tegen het montageprofiel; ontbreekt er iets?
- Welke kloon van het portaal is de werkkopie (`~/Developer` of `~/Desktop`)?
- Wie verwerkt de opmerkingen van de klant: dezelfde persoon die het script aanvroeg?
