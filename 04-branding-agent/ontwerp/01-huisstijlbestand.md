# Stap 1: het huisstijlbestand (voorstel, 21/11/2026)

Status: VOORSTEL, wacht op akkoord van Eghosa.

## Waarom

Vandaag staat de huisstijl van een klant op vijf plekken, telkens met de hand overgeschreven:

| Waar | Wat | Gelezen door |
| --- | --- | --- |
| `Video Projecten/<Klant>/00_KLANTBREIN.md` §2, §3 | huisstijl en montagestijl in tekst | de agent (mens-leesbaar) |
| `assets/statics/stijl.json` | fonts, kleuren, titel, label, knop | `tools/statics.py` |
| `assets/filmcraft/tekststijlen.json` | captions | `filmcraft_bouw.py` |
| `assets/graphics/animaties/<kode>_animaties.py`, `_social/<klant>_stijl.py` | CSS en kleuren in code | de animatiescripts |
| `mail-bot/klanten/<Klant>/stijl/basis.css`, `KLANTBREIN.md` §2 | mailstijl | `bouw.py` |
| calculator `index.html` `:root` | CSS-variabelen | de browser |

## Voorstel

**Eén bestand `huisstijl.json` per klant en per stijlrichting.** De bestaande tools blijven werken zoals ze zijn: een kleine
vertaler maakt uit het huisstijlbestand de bestanden die ze nu al lezen (`stijl.json`, `tekststijlen.json`, `basis.css`,
CSS-variabelen van de calculator). Niets aan `statics.py`, FilmCraft of de mailbot hoeft te veranderen.

**Plek in video-agent:**

```
Video Projecten/<Klant>/huisstijl/
  analyse.md               merkanalyse (stap 2), met screenshots en bronnen
  bronnen/                 screenshots van website en Instagram, logo-origineel
  A/huisstijl.json         stijlrichting A (dicht bij het huidige merk)
  B/huisstijl.json         stijlrichting B (gedurfder)
  C/huisstijl.json         stijlrichting C (gedurfder)
  A/stijlkaart.png …       één kaart per richting: kleuren, fonts, knoppen, voorbeeldtitel
  gekozen.json             na de brandingmeeting: kopie van de gekozen richting, status VASTGELEGD
```

Versies: elke wijziging = nieuwe versie (`versie` +1, `herkomst` ai of handmatig, `vorige` = vorige versie). Git bewaart de
geschiedenis; het portaal bewaart de opgeleverde beelden. De agent werkt altijd verder op de hoogste versie.

## Velden

| Blok | Velden | Gebruikt door |
| --- | --- | --- |
| `meta` | klant, klantcode, richting (A/B/C/gekozen), status (concept / voorstel / goedgekeurd / vastgelegd), versie, herkomst (ai / handmatig), vorige, datum, bron (website + datum) | alles |
| `logo` | bestanden (kleur, wit, donker), gebruik op licht en donker, minimale breedte, vrije ruimte | posts, mail, video, calculator, presentatie |
| `kleuren` | lijst van {naam, hex, rol}; rollen: primair, accent, tekst, achtergrond, vlak, knop, knoptekst | alles |
| `typografie` | titel, tekst, label, knop: familie, bestand of webfont, gewicht, hoofdletters, spatiëring, regelafstand; terugval-font | alles |
| `vormen` | hoekradius, knopvorm, lijnen, kicker (blokje, lijn, geen), schaduw, motief | posts, mail, calculator |
| `beeld` | beeldtaal, overlay (kleur, dekking), voor/na ja/nee, bronnen (eigen foto's eerst, AI als terugval, nooit stock) | posts, mail, video |
| `toon` | aanspreekvorm (je/u), toon in 3 woorden, voorbeeldzinnen, verboden woorden, CTA-teksten | posts, mail, calculator, video |
| `posts` | per template (realisatie, review, expertvraag): opbouw-variant, formaat (4:5, 1:1, 9:16), vaste elementen | posts |
| `nieuwsbrief` | kop, hero, blokken, knop, footer | mail |
| `video` | captions (font, gewicht, grootte, kleur, accentkleur, kader), hookstijl, overgangen (presets uit `config/motion.json`), tempo, eindkaart, grade, geluid | video |
| `calculator` | kaart (radius, schaduw), keuzetegels, voortgangsbalk, knop | calculator |
| `regels` | wat niet mag (merk), en vast: niveau 1-5 van `00_BASIS.md` §3 kan een huisstijl nooit wijzigen | alles |

## Voorbeeld (fictieve waarden)

```json
{
  "meta": {"klant": "Voorbeeld Bouw", "klantcode": "VBB", "richting": "A", "status": "voorstel",
           "versie": 3, "herkomst": "handmatig", "vorige": 2, "datum": "2026-11-21",
           "bron": {"website": "https://voorbeeld.be", "gelezen_op": "2026-11-21"}},
  "logo": {"kleur": "assets/logo/logo.png", "wit": "assets/logo/logo_wit.png", "min_breedte_px": 160},
  "kleuren": [
    {"naam": "blauw", "hex": "#3366AA", "rol": "primair"},
    {"naam": "bijna zwart", "hex": "#222222", "rol": "tekst"},
    {"naam": "lichtgrijs", "hex": "#F0F0F0", "rol": "vlak"},
    {"naam": "wit", "hex": "#FFFFFF", "rol": "achtergrond"}
  ],
  "typografie": {
    "titel": {"familie": "Montserrat", "gewicht": 800, "hoofdletters": true, "spatiering": 0.02, "regelafstand": 1.05},
    "tekst": {"familie": "Montserrat", "gewicht": 400, "regelafstand": 1.5},
    "label": {"familie": "Montserrat", "gewicht": 700, "hoofdletters": true, "spatiering": 0.18},
    "knop":  {"familie": "Montserrat", "gewicht": 700, "hoofdletters": true, "spatiering": 0.1},
    "terugval": "Arial, sans-serif"
  },
  "vormen": {"radius_px": 0, "knop": "recht vlak", "kicker": "blokje", "schaduw": "geen"},
  "beeld": {"taal": "echte werven, daglicht, sober", "overlay": {"kleur": "#222222", "dekking": 0.45}, "stock": false},
  "toon": {"aanspreekvorm": "je", "woorden": ["professioneel", "rustig", "persoonlijk"],
           "cta": ["Gratis richtprijs", "Offerte aanvragen"], "verboden": []},
  "video": {"captions": {"familie": "Montserrat", "gewicht": 900, "grootte": 58, "kleur": "#FFFFFF",
                         "accent": "#3366AA", "kader": "geen"},
            "overgangen": ["cut", "sectie"], "geluid": "alleen sfx"}
}
```

## Wat dit oplevert
- Drie stijlrichtingen = drie bestanden; een stijlrichting bijsturen = één waarde aanpassen, alles volgt.
- Na de meeting wordt `gekozen.json` de huisstijl die in Client Check komt (stap 11), in hetzelfde formaat.
- Bestaande klanten (Floors & More, ABBI, Loni Bouw) kunnen later hetzelfde bestand krijgen uit hun huidige `stijl.json` en klantbrein.

## Niet in dit bestand
De inhoud (teksten, reviews, projecten). Die komt per post uit de briefing of het klantbrein, nooit verzonnen.
