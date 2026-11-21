# 05 Briefing check (taak 13)

Lees eerst `../CLAUDE.md`.

## Doel
Een Claude-skill die start zodra iemand "zet het in Wrike" zegt: eerst zelf context zoeken, dan alleen vragen wat ontbreekt,
en pas dan een complete taak aanmaken in de juiste Wrike-map met klantprefix. Geen aparte interface.

## Bron in de briefing
Sectie "13 · Briefing check": trigger, context eerst, vragen tot compleet (wat, klant, waarom, deadline, wie, bronmateriaal en links,
wat "klaar" is, wat niet mag), pas dan aanmaken. Geen aannames; context in de taak zelf. Ongeveer 10 huisregels nog te schrijven
(bv. Floors & More als lat, altijd een sprekend persoon in video's).

## Wat al bestaat
- ClientsCheck MCP: `search_conversations`, `search_wrike_tasks`, `get_client_overview`, `get_conversation`.
- Vault `wrike-run`: `createTask`, `folders`, `searchTasks`; of de Wrike-connector in Claude.
- Klantcodes in gebruik: JANS, ABBI, RENB, QBUI, EDK, EGSP, VELV, SCHP, ...
- De nachtploeg heeft een eigen manier om taken aan te maken (memory `wrike-taak-aanmaken`, niet in de repo); titelformaat
  `NN | KLANTCODE omschrijving` (`night-shift-thibo/regels/feedback.md`, 9/11).
- Concept-skill `wrike-briefing` van de nachtploeg (21/11): `night-shift-thibo/dag/2026-11-21/briefing-skill/SKILL.md`, met 9 voorlopige
  huisregels. Taak 13 is samenwerk met Thibo (zie `VOORTGANG.md`): we bouwen op dat concept verder, niet ernaast.
- `wrike-run createTask` controleert niet op dubbels: de skill zoekt zelf eerst een bestaande taak.

## Wat je bouwt
- [ ] `skill/SKILL.md` in deze map: trigger, werkwijze, vraagregels, taakformaat.
- [ ] Context eerst: klant, mails, WhatsApp, Fireflies, bestaande Wrike-taken, Client Check.
- [ ] Vragen tot compleet, zonder vaste checklist per taaktype.
- [ ] Taakformaat: `NN | KLANTCODE omschrijving` (zoals de nachtploeg; betekenis van NN navragen), beschrijving met context, links, klaar-definitie, wat niet mag, eigenaar, deadline.
- [ ] `huisregels.md`: de ongeveer 10 huisregels (eerst concept, Wannes keurt).
- [ ] Nooit feiten verzinnen: onbekend wordt een vraag.
- [ ] Opslaan als skill via de review-kaart in Claude (niet als los bestand).

## Klaar als
- Een vage vraag levert eerst vragen op, geen taak.
- Een collega voert de taak uit zonder de oorspronkelijke chat of mailbox.

## Werk in
Deze map (`skill/`, `huisregels.md`). Geen code in andere repo's.

## Open vragen
Zie `VOORTGANG.md`.
