# Structured Analysis (SA) Artifacts

Source of truth: `docs/preliminary_requirements.md`.

Generation order:

1. `event_list.md`
2. `context_diagram.md`
3. `dfd_level0.md` → `dfd_level1.md` → `dfd_level2.md` → `dfd_level3.md`
   (update `data_dictionary.md` and `process_specifications.md` after each level)
4. `fsm_level4.md` — Controller FSM (no process specifications)
5. Consistency verification across all artifacts

Rules:

- Preserve consistency between the Event List and the Context Diagram.
- Maintain DFD balancing between adjacent levels.
- Use consistent process numbering and flow names.
- Describe every process in Levels 0–3.
- Use Mermaid for all DFD and FSM diagrams.
- Do not invent requirements or unsupported behavior.

Human approval is required before Structured Design begins.
