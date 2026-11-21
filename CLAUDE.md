# AI Weekend: werkmap van Eghosa

Deze repo is de werkmap van Eghosa voor de **Branding Agent** (Revenue Lab / Red Pepper, briefing 21 november 2026).
Het is een cockpit, geen codeproject: hier staan de context, het plan en de voortgang. De code komt in de bestaande repo's.
Sinds 21/11 zijn de branding agent (`04-branding-agent/`) en de scriptbot (`01-scriptbot/`, terug sinds 21/11 avond) de
onderdelen; de andere zijn uit deze werkmap gehaald (terug te vinden in de git-geschiedenis, laatste stand met alles: commit
`f482e06`). Werk je aan de scriptbot: lees `01-scriptbot/CLAUDE.md` en `01-scriptbot/VOORTGANG.md` in plaats van die van 04.

## Werkafspraken

- Werk in het Nederlands, ook in statusupdates en tool-beschrijvingen. Code, bestandsnamen en commits mogen Engels.
- Eerst lezen en analyseren, dan een plan voorleggen, dan pas bouwen na een uitdrukkelijk ja van Eghosa.
- Lees eerst deze CLAUDE.md, dan `04-branding-agent/CLAUDE.md`, dan `04-branding-agent/VOORTGANG.md`.
- Werk `04-branding-agent/VOORTGANG.md` bij na elke sessie: wat gedaan, wat open, welke beslissing, met datum. Commit en push.
- Bij twijfel over de scope geldt `00-bronnen/briefing-branding-2026-11-21.md`. "De oorspronkelijke briefing" is
  `00-bronnen/briefing-wannes-2026-11-21.md` (§11 Branding agent).
- Pas de scope niet zelf aan. Een verschil of een nieuw idee: noteren in `VOORTGANG.md` onder "Open vragen".
- Eghosa behoudt de creatieve eindcontrole: de agent stelt voor en voert uit, Eghosa keurt goed. Een handmatige aanpassing
  wordt nooit overschreven.

## Harde regels (uit de bestaande repo's, gelden overal)

- **Client Check is het enige klantbrein.** Geen tweede database of klantbestand (beslissing DEC-G7 in ClientsCheck).
- **Op de live Client Check (Supabase `ubbthfgfxhttxlkyqdlw`) schrijft Claude nooit zelf**: geen `supabase db push`,
  `link` of `config push`. Migraties als idempotent script, lokaal getest; Eghosa draait ze. Het portaal (schema `portaal`)
  staat in dezelfde database: dezelfde regel.
- **Klantmails verstuurt Claude nooit.** Dat doet alleen Romina (in naam van Wannes). Klantcommunicatie = concept in Vandaag.
- **Strilio-code (`sprout-lead-core-new`)** volgt de regels van die repo: eigen branch, PR, checks van GitHub Actions, merge naar
  `main` met het releaseslot uit §1d van `AGENTS.md`. Productiemigraties en deploys alleen na een uitdrukkelijk ja.
- **Wrike-taken aanmaken** alleen via de Vault (`wrike-run`) met de goedkeuringszin; eerst zoeken of de taak al bestaat.
- **Testen:** testklant "Dries Test"; testberichten (sms/WhatsApp) alleen naar het nummer van Thibo uit `night-shift-thibo/CLAUDE.md`, nooit naar echte leads.
- **Geld en klantafspraken** (budget, prijzen, beloftes) nooit zonder akkoord.
- **Nooit verzonnen reviews, claims of resultaten.** Prijzen als "vanaf" of "ongeveer".
- **Signaleren, voorstellen, goedkeuren, uitvoeren** blijven gescheiden. Elke wijziging naar buiten krijgt een logregel.
- **Idempotent:** alles wat iets aanmaakt, mag twee keer draaien zonder dubbel resultaat.
- Geen sleutels, tokens of wachtwoorden in deze repo, in chat of in logs. Geen echte klantgegevens in deze repo
  (die horen in de klantmap van video-agent of in Client Check).

## Waar de code staat

Alle repo's staan op GitHub en op deze laptop in `~/Developer/`, behalve video-agent (zie onder). Elke repo heeft een eigen CLAUDE.md of AGENTS.md; die gaat voor.

| Repo | Rol in de branding agent |
| --- | --- |
| `Red-Pepper-Antwerp/ClientsCheck` | Klantbrein: de definitief goedgekeurde huisstijl; MCP-server waar andere agents lezen |
| `Red-Pepper-Antwerp/revenuelab-portaal` | Klantpagina (tabs Campagnes · Scripts · Klantfeiten): scriptrondes, versies, opmerkingen, goedkeuring; de posts van de branding agent komen in een campagne |
| `Eghosag1/creatieve-motor` (vroeger video-agent; lokale map blijft `~/Desktop/video-agent`) | Productie: merkanalyse, posts/statics, videostijl en testclips, (straks ook) mails |
| `Eghosag1/mail-bot` | Nieuwsbrief: stijlronde en bouwdoos (wordt samengevoegd in video-agent, zie VOORTGANG) |
| `Red-Pepper-Antwerp/night-shift-thibo` | Calculatorsjabloon (`dag/2026-11-19/perf-calculator/`) en calculatorregels |
| `Red-Pepper-Antwerp/red-pepper-connector-vault` | Wrike-taken (`wrike-run`), Google (`google-run`), met goedkeuringszin |
| `Red-Pepper-Antwerp/sprout-lead-core-new` | Strilio: nieuwsbrieven versturen met klikmeting, leads uit de calculator (later) |

**video-agent staat als enige repo op het bureaublad: `~/Desktop/video-agent`** (beslist 21/11; daar draaien de videojobs,
de worktrees en de launchd-taak `be.redpepper.feedbackronde`). Er is geen tweede kloon meer in `~/Developer`.
Geef hem erbij met `claude --add-dir ~/Desktop/video-agent`.

## Bronnen

- `00-bronnen/briefing-branding-2026-11-21.md`: de briefing voor de branding agent (leidend).
- `00-bronnen/briefing-wannes-2026-11-21.md`: de oorspronkelijke briefing (§11 Branding agent: posttemplates, brandingmeeting, pakket).
