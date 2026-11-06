# Test-Driven Development (TDD) Artifacts

Source of truth: approved artifacts in `artifacts/SD/` and `artifacts/SA/`.

Expected artifacts:

- `unit_test_cases.md` — test cases traced to requirements and SA artifacts
- `test_execution_results.md` — recorded output of actual test runs
- `coverage_report.md` — measured coverage from `make coverage`

Rules:

- Follow the Red-Green-Refactor cycle.
- Derive test cases from requirements and approved SA artifacts.
- Do not proceed while required tests fail.
- Do not claim verification success without executing the tests.

Production code lives in `src/` and `include/`; unit tests live in `tests/`.
