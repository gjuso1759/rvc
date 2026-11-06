# Structured Analysis (SA) Artifacts

Source of truth: `docs/preliminary_requirements.md`.

## Generation Order

1. `event_list.md`
2. `context_diagram.md`
3. `DFD/dfd_level_0.md` → `DFD/dfd_level_1.md` → `DFD/dfd_level_2.md` → `DFD/dfd_level_3.md`
   (update `data_dictionary.md` and `process_specifications.md` after each level)
4. `DFD/dfd_level_4.md` — Controller FSM (no process specifications)
5. Consistency verification across all artifacts

## Inputs Required for DFD Work

- `docs/preliminary_requirements.md`
- `artifacts/SA/event_list.md`
- `artifacts/SA/context_diagram.md`
- `artifacts/SA/data_dictionary.md` (if available)
- `artifacts/SA/DFD/dfd_level_0.md` (if available)
- `artifacts/SA/DFD/dfd_level_1.md` (if available)
- `artifacts/SA/DFD/dfd_level_2.md` (if available)
- `artifacts/SA/DFD/dfd_level_3.md` (if available)

## Rules

- Preserve consistency between the Event List and the Context Diagram.
- Maintain DFD balancing between adjacent levels.
- Use consistent process numbering and flow names.
- Describe every process in Levels 0–3.
- Use Mermaid for all DFD and FSM diagrams.
- Do not invent requirements or unsupported behavior.

Human approval is required before Structured Design begins.
