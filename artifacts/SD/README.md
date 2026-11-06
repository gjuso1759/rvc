# Structured Design (SD) Artifacts

Source of truth: approved artifacts in `artifacts/SA/`.

Expected artifacts:

1. `transform_analysis.md` — Afferent Flow, Central Transformation, Efferent Flow
2. `structure_chart.md` — Mermaid module hierarchy derived from the SA functional decomposition

Rules:

- Transform Analysis precedes the Structure Chart.
- Distinguish module calls from DFD data flows.
- Apply information hiding, modularity, low coupling, and high cohesion.
- Define clear module responsibilities and interfaces.
- Maintain traceability from SA processes to SD modules.

Human approval is required before TDD begins.
