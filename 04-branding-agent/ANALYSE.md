# Analyse: wat bestaat er al voor de branding agent (21/11/2026)

Alleen gelezen, in de repo's (niet in de live database, Wrike of Google). Paden relatief aan `~/Developer/`
(video-agent: de inhoud is gelijk in beide kloons).

## Herbruikbaar

| Onderdeel | Wat er is | Waar |
| --- | --- | --- |
| Merkanalyse | Huisstijl van de website (CSS-kleuren, fonts, knoppen, logo, beeld, toon) naar klantbrein §2 en §3; met de hand door de agent, geen tool. De website wint altijd. | `video-agent/VIDEO AGENT/06_MONTAGEPROFIEL.md` §11 (r. 345-381), §4.2; `00_BASIS.md:15`; `templates/klant/00_KLANTBREIN.md:30,41` |
| Posts / statics | HTML → PNG met headless Chrome, bouwblokken en automatische controles; echte foto's eerst, anders AI, nooit stock. Bron per versie als Python-script. | `video-agent/VIDEO AGENT/tools/statics.py`; `Video Projecten/Floors & More/statics/social-2026-11-v2…v16`, `-stijl2-v1…v9` |
| Socialposts | Soorten video/static/carrousel, posttekst-JSON, controles, FINAAL (genereert niets). | `VIDEO AGENT/13_SOCIALPOSTS.md`, `tools/posts.py` |
| Nieuwsbrief | Stijlronde: varianten op een keuzepagina, dan bouwdoos; VOORLOPIG → VASTGELEGD na klantakkoord. HTML ≤600 px, inline CSS. | `mail-bot/templates/STIJL.md:18-26`; `mail-bot/klanten/Janssen & Janssen/mail/werk/overlap/kies.html`, `…/stijl/bouw.py`; `video-agent/VIDEO AGENT/14_MAILS.md`, `tools/mails.py` |
| Videostijl | Clips zonder shootbeelden: ffmpeg-montage uit JSON, typografische overlays, HTML-animaties (ProRes 4444 met alfa). Stijlbestanden: captions, motion, animatiespecs. Editor: FilmCraft (`.fcproj` handmatig aan te passen). | `Video Projecten/_social/montage.py`, `overlay.py`, `abbi_stijl.py`; `tools/html_animatie.py`; `assets/filmcraft/tekststijlen.json`, `config/motion.json`, `assets/graphics/animaties/specs.json`; `tools/filmcraft_bouw.py` |
| Calculator | Werkend sjabloon: losse site op Netlify, huisstijl in CSS-variabelen, prijzen in `pricing.mjs`, antwoorden naar Strilio `zapier-crm-intake`. Regels: start van de template, alleen vragen die de prijs bepalen, alleen totale richtprijs. | `night-shift-thibo/dag/2026-11-19/perf-calculator/` (`index.html:17-21`); `night-shift-thibo/regels/feedback.md:22,23,41,42`. Template-repo `Office-omgeving/calculator-energiedekempen` niet gekloond. |
| Review en versies | Campagnes → ads → versies → bestanden, opmerkingen met pins, intern goedkeuren, akkoord Wannes, klantlink, akkoord klant. Opgeleverde versie nooit overschreven. Soorten: video, static, carrousel, mail. Creatives alleen via de bot (`portaal-bot`). | `revenuelab-portaal/docs/BOT-API.md`, `docs/08_PORTAAL.md:17-80`; `supabase/migrations/20261118180000_portaal_mail.sql`; `video-agent/VIDEO AGENT/tools/portaal.py` |
| Keuzevraag | Bot stelt het team een vraag met 2-6 opties met afbeelding; `stijl_goedkeuren` zet `klantprofielen.stijl_vastgelegd_op`. | `revenuelab-portaal/supabase/migrations/20261030100000_portaal_kaarten.sql:212-227`, `20261118100000_portaal_voorlaag.sql:1063-1072` |
| Goedkeuringspatroon | AI vult voor, mens bevestigt, bevestigd wordt nooit overschreven (`status` voorstel/bevestigd). | `ClientsCheck/supabase/functions/client-profile/index.ts:14-16`, `migrations/20261029100000_client_profile.sql` |
| Wrike | `createTask`, `searchTasks`, `taskDetails` met goedkeuringszin `GOEDKEUREN EN UITVOEREN`; geen dubbelcontrole, geen "map van deze klant". Mapping klant → map in Client Check: `client_integrations.wrike_folder_id`. | `red-pepper-connector-vault/supabase/functions/wrike-run/index.ts:196-232`; `ClientsCheck/supabase/functions/wrike-tasks/index.ts:1615` |
| Google | Slides: sjabloon kopiëren + tekst vervangen (geen afbeeldingen). Drive, Gmail-concept. | `red-pepper-connector-vault/supabase/functions/google-run/index.ts:151-164` |
| Strilio-nieuwsbrief | Blokeditor, `BrandSettings` per tenant (logo, kleuren, font), versturen via Resend, opens/kliks/afmelden. Figma-import. | `sprout-lead-core-new/src/stores/email-templates-store.ts:77,183`; `supabase/functions/email-template-figma-import` |

## Ontbreekt

1. **Geen gebeurtenis bij een nieuwe klant.** Geen AFTER INSERT-trigger op `public.clients`; enige automatische weg is de
   Qwilr-webhook (`ClientsCheck/supabase/functions/qwilr-webhook/index.ts:209,231`). `onboarding.jobs` bestaat, maar de worker
   heeft geen handlers en draait niet (`supabase/functions/onboarding-worker/index.ts:19-20`). Nachtploeg reageert niet op nieuwe klanten.
2. **Geen centrale huisstijl.** In `public.clients`: `branding jsonb` (ongebruikt), `brand_color_*`, `logo_url` (van Onboarding OS).
   Geen versies, geen voorstel/bevestigd, geen MCP-tool die huisstijl leest of schrijft (`copilot-mcp/tools.ts`). Uploads uit de
   onboarding worden na 3 maanden gewist (DEC-33, DEC-69). De bots hebben elk een eigen klantbrein in bestanden.
3. **Geen gedeeld huisstijlbestand tussen de bots.** Kleuren en vormen staan in de code per klant
   (bv. `Floors & More/assets/graphics/animaties/fm_animaties.py`).
4. **Handmatig bewerken niet geregeld.** Team kan in het portaal niet uploaden of bewerken (besluit 17/11, `PLANNING.md:420`);
   geen vlag "handmatig"; opnieuw renderen laat een handmatige aanpassing stil verloren gaan.
5. **Portaal:** geen soort voor merkanalyse, calculator, presentatie; geen groep per stijlrichting; geen HTML-weergave of
   iframe; opslag laat geen `text/html` toe; geen keuzepagina voor de klant.
6. **Geen presentatie of deck**, nergens.
7. **Geen Instagram-analyse**: alleen Meta-ID's (`client_integrations.meta_instagram_account_id`).
8. **Benoemde posttemplates** (realisatie, review, expertvraag) bestaan niet; een reviewpost nergens.
9. **Conflict:** het montageprofiel zegt bij hookconcepten "varianten op het vertrekpunt, geen totaal andere richtingen"
   (`06_MONTAGEPROFIEL.md:153`). Beslist 21/11: voor de stijlronde A dichtbij, B en C gedurfder binnen logo en kleuren.

## Niet gecontroleerd
- De live stand van de database (kolommen, triggers, cron, webhooks in het dashboard).
- Of FilmCraft, Chrome, ffmpeg en Codex op deze laptop draaien (niets uitgevoerd).
- Het template-repo `Office-omgeving/calculator-energiedekempen`; het mailprogramma waarmee mails nu verstuurd worden.
- Wat NN betekent in de Wrike-titel `NN | KLANTCODE omschrijving`.
