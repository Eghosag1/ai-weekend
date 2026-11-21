# AI Weekend: werkmap van Eghosa

Deze repo is de werkmap voor alles wat Eghosa bouwt voor de AI Weekend-briefing (Revenue Lab / Red Pepper, 20-21 november 2026).
Het is een cockpit, geen codeproject: per onderdeel staat hier de context en de voortgang. De code komt in de bestaande repo's
die in elke map genoemd worden. Alleen wat nergens anders hoort (skills, decktemplates), staat in de map zelf.

## Werkafspraken

- Werk in het Nederlands, ook in statusupdates en tool-beschrijvingen. Code, bestandsnamen en commits mogen Engels.
- Eerst lezen en analyseren, dan een plan voorleggen, dan pas bouwen na een uitdrukkelijk ja van Eghosa.
- Open je een onderdeel: lees eerst deze CLAUDE.md, dan die van de map, dan `VOORTGANG.md` van de map.
- Werk `VOORTGANG.md` van de map bij na elke sessie: wat gedaan, wat open, welke beslissing, met datum. Commit en push.
- Bij twijfel over de scope geldt de nieuwste briefing (`00-bronnen/briefing-wannes-2026-11-21.md`). De bouwspecificatie
  (`00-bronnen/bouwspecificatie-2026-11-21.pdf`) volgt een oudere versie. Verschillen: `00-bronnen/bouwplan.md`.
- Pas de scope niet zelf aan. Een verschil of een nieuw idee: noteren in `VOORTGANG.md` onder "Open vragen".

## Harde regels (uit de bestaande repo's, gelden overal)

- **Client Check is het enige klantbrein.** Geen tweede database of klantbestand (beslissing DEC-G7 in ClientsCheck).
- **Op de live Client Check (Supabase `ubbthfgfxhttxlkyqdlw`) schrijft Claude nooit zelf**: geen `supabase db push`,
  `link` of `config push`. Migraties als idempotent script, lokaal getest; Eghosa draait ze. (afspraak in `revenuelab-portaal`)
- **Klantmails verstuurt Claude nooit.** Dat doet alleen Romina (in naam van Wannes). Klantcommunicatie = concept in Vandaag.
- **Strilio-code (`sprout-lead-core-new`) merget alleen Dries.** Bundel Strilio-wijzigingen in zo weinig mogelijk PR's.
- **Testen:** testklant "Dries Test"; testberichten (sms/WhatsApp) alleen naar het nummer van Thibo uit `night-shift-thibo/CLAUDE.md`, nooit naar echte leads.
- **Geld en klantafspraken** (budget, prijzen, beloftes) nooit zonder akkoord; budgetregels staan in `night-shift-thibo/regels/budgetten.md`.
- **Signaleren, voorstellen, goedkeuren, uitvoeren** blijven gescheiden. Elke wijziging naar buiten krijgt een logregel.
- **Idempotent:** alles wat iets aanmaakt, mag twee keer draaien zonder dubbel resultaat.
- Geen sleutels, tokens of wachtwoorden in deze repo, in chat of in logs.

## De onderdelen

| Map | Wat | Eigenaar |
| --- | --- | --- |
| `01-scriptbot` | Scripts uit de klantbriefing | Eghosa (briefing: "tonight") |
| `02-kickoff-agent` | Klantbriefing, vragenlijst, mails, Strilio-inrichting, calculator, agenda, controlemomenten | Eghosa |
| `03-kickoff-deck` | Decktemplates volgens de 17 deckregels | Eghosa (waarschijnlijk) |
| `04-branding-agent` | Stijlronde, 3 posttemplates, nieuwsbrief, testclips, brandingmeeting | Eghosa |
| `05-briefing-check` | Claude-skill die complete Wrike-taken maakt | Eghosa |
| `06-nieuwe-klant` | Nieuwe klant in een commando | Eghosa |
| `07-consulting` | Ideeenlijst + one-pager per meeting | Eghosa |
| `08-shoots-hermann` | Contentmap per klant + route op vrije dagen | Eghosa |
| `09-taak10-agents` | Opportunities, PA-opvolging, reactivatie, retentiecheck | Eghosa |
| `10-meeting-concepten` | Concepten voor go-live, maand 1 tot 3, strategiesessie | Eghosa bouwt, Thibo vult maand 2 tot 4 |
| `_thibo` | Afspraken met Thibo over taak 12 en 15 | Thibo |

Volgorde: 01 en 05 eerst, dan 06, dan 02 samen met 03 en 04, daarna 09, 07, 08, 10.

## Waar de code staat

Alle repo's staan op GitHub. `scripts/repos-klonen.sh` kloont ontbrekende repo's naast deze map (standaard in `~/Developer/`).
Op de laptop van het weekend staan `video-agent` en `revenuelab-portaal` al onder `~/Revenue Lab/` (`VIDEO-AGENT-overdracht`, `revenuelab-portaal`): kijk daar eerst.

| Repo | Waarvoor |
| --- | --- |
| `Red-Pepper-Antwerp/ClientsCheck` | Klantbrein, copilot, onboardingmodule, MCP-server, signalen |
| `Red-Pepper-Antwerp/sprout-lead-core-new` | Strilio: pipelines, workflows, offertes, nieuwsbrieven, MCP |
| `Red-Pepper-Antwerp/red-pepper-connector-vault` | Schrijfacties naar buiten met goedkeuringszin (Strilio-setup, Meta, Wrike, Google) |
| `Eghosag1/video-agent` | Videobot, statics, posts, klantbrein per klant |
| `Red-Pepper-Antwerp/revenuelab-portaal` | Review en akkoord van creatives |
| `Eghosag1/mail-bot` | Nieuwsbrieven met stijlronde |
| `Red-Pepper-Antwerp/night-shift-thibo` | Uitvoering van taken met Z-regels, budgetplafonds, weekrapporten |
| `dries-full-stack/core-seo-hub` | SEO-hub (enkel voor maand 3) |

Elke repo heeft een eigen CLAUDE.md of AGENTS.md. Die gaat voor binnen die repo.

## Bronnen

- `00-bronnen/briefing-wannes-2026-11-21.md`: de nieuwste briefing (leidend bij twijfel).
- `00-bronnen/bouwspecificatie-2026-11-21.pdf`: de bouwspecificatie met acceptatiecriteria.
- `00-bronnen/bouwplan.md`: samenvatting van de analyse, open beslissingen en link naar het volledige bouwplan.
