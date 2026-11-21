# AI Weekend: werkmap

Werkmap van Eghosa voor de acht AI Weekend-opdrachten van Revenue Lab. Per onderdeel een map met `CLAUDE.md` (vaste
context) en `VOORTGANG.md` (wat gedaan is en wat open staat). De code komt in de bestaande repo's.

## Starten op een (andere) laptop

```sh
cd ~/Developer
git clone https://github.com/Eghosag1/ai-weekend.git AI-Weekend
cd AI-Weekend
./scripts/repos-klonen.sh          # kloont de repo's die nog ontbreken naast deze map
```

Werken aan een onderdeel: open Claude Code in die map, bv. `cd 02-kickoff-agent && claude`. Geef de repo erbij met
`--add-dir`, bv. `claude --add-dir ../../ClientsCheck`. Claude leest eerst de `CLAUDE.md` bovenaan en die van de map.

Begin elke sessie met `git pull` en eindig met commit + `git push`, zodat de voortgang mee is op de andere laptop.

## Inhoud

- `CLAUDE.md`: gedeelde regels en het overzicht van alle onderdelen.
- `00-bronnen/`: briefing, bouwspecificatie, samenvatting van het bouwplan.
- `01-` tot `10-`: de onderdelen.
- `_thibo/`: afspraken met Thibo over taak 12 en 15.
- `scripts/repos-klonen.sh`: de nodige repo's klonen.
