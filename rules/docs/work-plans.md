# Work plans

- Split work into clear phases. Each phase must end with concrete QA checks.
- Give every task a `todo` or `done` status.
- Each group of tasks must produce working vertical behavior at every checkpoint.
- Keep unverified QA checks as `todo`. Record skipped checks and blockers explicitly.
- Describe interfaces, data shapes, ownership, and failure behavior in the relevant phase when needed.

## Template

````markdown
# <Feature or change> plan

Status: `todo`

## Goal and scope

<Describe the intended outcome and how success will be measured.>

- <Behavior or component this plan changes.>

## Current state

<Describe the existing behavior, its limits, and what must stay unchanged.>

## Relevant files

- `<path>`: <responsibility and planned change>.

## Phase 1: <First working end-to-end outcome>

Outcome: <What can be exercised after this phase, and in which environment.>

- [todo] <Implement the smallest complete path through the affected components.>
- [todo] <Handle the failure cases needed for that path.>
- [todo] <Add or update behavior tests and affected documentation.>

QA checkpoint:

- [todo] `<command or manual steps>` produces <specific expected result>.
- [todo] <Invalid input or an operational failure> produces <expected behavior>.
- [todo] <Existing behavior outside the change> still works.

QA evidence:

- <After running checks, record the command or steps, environment, and result. Note mocks, skipped checks, and blockers.>

## Phase 2: <Extend or roll out the working behavior>

Outcome: <The next complete behavior available after this phase.>

- [todo] <Extend the working path to the remaining in-scope cases.>
- [todo] <Update tests and documentation for those cases.>
- [todo] <Owner: deploy or activate the change after its prerequisites pass.>

QA checkpoint:

- [todo] <Representative input> reaches <expected final output> in <target environment>.
- [todo] <Compatibility and isolation checks> confirm <specific unchanged behavior>.
- [todo] <Relevant project checks> pass.

QA evidence:

- <Record actual results and any remaining verification limits.>

...
````
