# 01 Scriptbot

Lees eerst `../CLAUDE.md`, dan dit bestand, dan `VOORTGANG.md`. Nieuw ontwerp van 22/11 (sessie 7). Het vorige ontwerp
(scriptrondes, klantfeiten in het portaal, werkertaak) staat in de git-geschiedenis: laatste stand in commit `3df99f5`.

Deze map is de cockpit (ontwerp, beslissingen, voortgang). De code komt in de repo's hieronder.

## Doel
Hermann (videograaf) of Gini (planner) vraagt in Claude Code in gewone taal een of meer advertentiescripts voor een klant:
waarover, waar er gefilmd wordt. De bot controleert de feiten in Client Check, houdt rekening met de scripts die de klant al
heeft, en schrijft het script in de chat met **per take hoe het gefilmd wordt en hoe de montage eruitziet**. Goedgekeurd in de
chat → finaal in het portaal; de klant keurt goed of geeft opmerkingen; daarna leest de videobot het script als montageplan.

## Zo werkt het

1. **Aanvragen in gewone taal**, geen commando. Bv. "Schrijf twee scripts voor Loni Bouw over de winterpromotie, we filmen op
   de werf in Mechelen." De skill springt aan op zijn beschrijving en vraagt alleen wat ontbreekt (wie in beeld, wat er op de
   locatie te zien is, aantal scripts en hooks).
2. **Feitencheck, telkens vers uit Client Check** (MCP `client-check`: `get_client_overview`, `search_conversations`,
   `get_conversation`, `search_commitments`; plus de antwoorden uit de onboardingtool). Geen kopie van de feiten ergens anders.
   De bot zoekt eerst naar nieuwe gesprekken, toont dan een tabel *feit · bron · datum* en signaleert: tegenstrijdig (bv.
   andere prijs in een recentere mail), verlopen (promotie voorbij einddatum), zonder bron (wordt een vraag, niet in het
   script). De gebruiker zegt "klopt" of past aan; pas dan schrijft de bot.
3. **Rekening houden met bestaande scripts**: de bot haalt de scripts van de klant uit het portaal (ook de eenmalig
   ingeladen oude scripts, herkomst `eerder_gebruikt`): geen herhaling van invalshoek of hook, leren van wat goedgekeurd of
   aangepast werd.
4. **Eerst 3-5 invalshoeken** (elk één regel + het feit waarop ze steunen), de gebruiker kiest, dan de volledige scripts.
   Bijsturen in het gesprek.
5. **Goedgekeurd in de chat → finaal in het portaal.** Geen versies. Status `wacht_op_klant`.
6. **Klant in het portaal** ziet alleen de tekst; keurt goed of geeft opmerkingen.
7. **Opmerkingen**: in Claude Code "verwerk de opmerkingen van de klant op <klant>" → het script wordt vervangen en gaat
   terug naar de klant. De opmerkingen blijven staan (waarom het veranderde).
8. **Na akkoord** leest de videobot het script met de regie uit het portaal (`portaal-bot`, actie `scripts`), bv. "monteer
   S2 van Loni Bouw". Geen koppeling met campagnes en geen "naar productie" (beslist 22/11).

De scriptlink (één per klant) stuurt wie het script maakte (Hermann of Gini) zelf door, niet Romina (Eghosa, 22/11); de bot
en het portaal versturen niets.

## Opbouw van een script

| Deel | Inhoud | Klant ziet |
| --- | --- | --- |
| Kop | titel, invalshoek, onderwerp, locatie, wie in beeld (klant / acteur) | titel |
| Hooks | H1, H2 … (elke hook = een volledige video met dezelfde body en einde) | ja |
| Takes | per take: **tekst** · **filmen** (kader, plek op de locatie, beweging, wie) · **montage** | alleen de tekst |
| Feiten | elk gebruikt feit: wat, bron (gesprek/mail + datum), letterlijk in welke take | nee |

**Montage per take: standaard niets extra.** De standaard is spreker in beeld met captions (montageprofiel). Een toevoeging
komt er alleen als ze iets bijbrengt, met één regel waarom (bv. een prijs die moet blijven hangen → tekstkaart; drie stappen
→ opsomming). De meeste takes: "spreker, geen toevoeging".

**Woordenlijst montage** (concept, na te kijken door Eghosa tegen `video-agent/VIDEO AGENT/06_MONTAGEPROFIEL.md`): namen die
de videobot kan uitvoeren in plaats van vage omschrijvingen.

| Naam | Wat | Bron |
| --- | --- | --- |
| `standaard` | spreker + captions | montageprofiel, `03_CAPTIONS.md` |
| `diepte_woord` | groot woord achter de spreker, wisselt op het gezegde woord (hook) | §4 |
| `opsomming` | punten met beeld per punt, op het woord | §5 |
| `cta_module` | herbruikbare klantmodule (bv. de calculator), geanimeerd | §10 |
| `broll` | ander beeld over de stem (welk beeld staat bij *filmen*) | na te kijken |
| `tekstkaart` | korte tekst of bedrag in beeld | na te kijken |
| `vrij` | idee buiten de lijst; de videobot vraagt het na in plaats van te gokken | |

Filmen: geen inspreken van take-nummers door Hermann; de videobot koppelt clips aan takes via de transcriptie (zoals nu).

## Architectuur

| Waar | Wat |
| --- | --- |
| **`Red-Pepper-Antwerp/scriptbot`** (nieuw, privé) | Plugin voor Claude Code: de skill + de koppelingen (`.mcp.json`) naar de MCP van Client Check en `portaal-mcp`. Hermann en Gini installeren hem in de desktop-app van Claude (tab Code). Updates via de plugin. |
| **Client Check** | Het enige klantbrein: de feiten komen telkens uit de gesprekken. Bestaande MCP `copilot-mcp` (OAuth met de eigen account; geen sleutels op laptops). Geen wijziging nodig. |
| **`revenuelab-portaal`** | Tabel scripts per klant (finaal, regie verborgen voor de klant, status `wacht_op_klant` → `opmerkingen` → `goedgekeurd`, herkomst `bot` / `eerder_gebruikt`), opmerkingen van de klant, klantscherm (lezen, goedkeuren, opmerkingen). Nieuwe Edge Function **`portaal-mcp`** (zelfde opzet en login als `copilot-mcp`): scripts van een klant ophalen, script finaal zetten, opmerkingen ophalen. Het portaal logt wie wat zette. |
| **creatieve-motor (`~/Desktop/video-agent`)** | De videobot leest het goedgekeurde script + regie uit het portaal (`portaal-bot`) als montageplan. De oude skill `scriptbot`, `16_SCRIPTS.md` en `tools/scripts.py` gaan weg (naamconflict, vervangen door de plugin). |

## Bouwvolgorde (na een ja van Eghosa)

| Stap | Wat | Raakt |
| --- | --- | --- |
| 1 | Woordenlijst montage nakijken met Eghosa; scriptformaat (leesbaar + JSON voor de regie) vastleggen met een voorbeeld op Dries Test | deze map |
| 2 | Portaal: migratie `20261121200000` (op GitHub, nooit live) herschrijven tot alleen scripts + opmerkingen; klantscherm; `portaal-mcp`; actie voor de videobot. Idempotent, lokaal getest; Eghosa zet live. | revenuelab-portaal |
| 3 | Plugin `scriptbot`: skill (aanvraag, feitencheck, bestaande scripts, invalshoeken, takes, naar portaal, opmerkingen verwerken) + `.mcp.json`. Test op Dries Test. | scriptbot (nieuw) |
| 4 | Eenmalig de ±89 oude scripts uit de klantmappen van video-agent in het portaal zetten als `eerder_gebruikt` (onzichtbaar voor de klant). Eghosa draait het. | video-agent, portaal |
| 5 | Videobot leest script + regie uit het portaal; oude scriptbot in video-agent opruimen. | video-agent |
| 6 | **Installatieprompt voor Hermann en Gini**: plakken in Claude Code → kijkt GitHub-toegang na, draait `claude plugin marketplace add Red-Pepper-Antwerp/scriptbot` en `claude plugin install scriptbot`, zegt waar ze eenmalig inloggen bij Client Check (browser, eigen account), test met Dries Test. | scriptbot (README) |

## Regels
- Elk feit (prijs, getal, promotie, belofte) heeft een bron in Client Check. Geen bron = vraag, niet in het script.
- Bedragen met "ongeveer" of "vanaf". Promotie alleen met einddatum die nog niet voorbij is. Geen review, resultaat of
  garantie zonder bron.
- De bot zet niets in het portaal zonder akkoord in de chat. Klantmails verstuurt de bot nooit.
- Geen sleutels op de laptops van Hermann en Gini: alles via de eigen login (OAuth).
- Testen op Dries Test. Echte klantgegevens alleen in Client Check en het portaal, nooit in deze werkmap of de plugin-repo.

## Let op
- Het portaal staat op deze laptop twee keer. **De werkkopie is `~/Desktop/revenuelab-portaal`** (Eghosa, 22/11); daar staat
  de migratie `20261121200000_portaal_scripts.sql`. De kloon in `~/Developer` niet gebruiken.
- Het scriptformaat (stap 1): `SCRIPTFORMAAT.md`.
