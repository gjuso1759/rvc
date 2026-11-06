# RVC — Robotic Vacuum Cleaner

A Robotic Vacuum Cleaner (RVC) system developed using **SASD-Guided Spec-Driven Development (SDD)**.

## Development Workflow

The project is phase-gated. Each phase requires human approval before the next begins.

1. **Structured Analysis (SA)** — derive system behavior from `docs/preliminary_requirements.md`
2. **Structured Design (SD)** — derive module structure from approved SA artifacts
3. **Test-Driven Development (TDD)** — Red-Green-Refactor implementation in C11
4. **System Testing** — scenario execution against the web-based RVC simulator

## Repository Layout

| Path | Contents |
| --- | --- |
| `docs/` | Preliminary requirements and supporting documentation |
| `artifacts/SA/` | Event List, Context Diagram, DFD Levels 0–4, FSM, Data Dictionary, Process Specifications |
| `artifacts/SD/` | Transform Analysis, Structure Chart |
| `artifacts/TDD/` | Unit test cases, test execution results, coverage reports |
| `artifacts/SystemTest/` | System test scenarios and results |
| `include/` | Public C header files (module interfaces) |
| `src/` | C11 production source code |
| `tests/` | Unit test source code |
| `simulator/` | Web-based RVC simulator |

## Deliverables

### Structured Analysis
- Context Diagram
- Event List
- Data Flow Diagrams (Levels 0–4)
- Finite State Machine
- Data Dictionary
- Process Specifications

### Structured Design
- Transform Analysis
- Structure Chart

### Test-Driven Development
- Unit Test Cases
- Test Execution Results
- Test Coverage Report
- Implementation Source Code

### System Testing
- Web-based RVC Simulator
- System Test Scenarios

## Implementation Constraints

- Production code is written in **C**, standard **C11**
- Compiled with **GCC**
- Module interfaces are separated into header files under `include/`
- Pointers are checked before dereferencing; global variables are avoided

## Build

```sh
make        # build the production sources
make test   # build and run unit tests
make clean  # remove build output
```

## Phase Status

| Phase | Status |
| --- | --- |
| Structured Analysis | Not started |
| Structured Design | Not started |
| Test-Driven Development | Not started |
| System Testing | Not started |
