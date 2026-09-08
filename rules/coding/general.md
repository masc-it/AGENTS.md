# Code design and best practices

## Design and dependencies

- Keep the design simple. Prefer fewer concepts, layers, and abstractions.
- Add an abstraction only when it clearly reduces complexity or duplication.
- Keep domain logic pure where practical. Isolate I/O and other side effects at explicit boundaries.
- Group code by domain or responsibility. Avoid miscellaneous `utils` modules.
- Keep module dependencies explicit, minimal, and unidirectional. Avoid circular dependencies.
- Prefer composition over inheritance and large multipurpose abstractions.
- Keep code understandable without having to inspect many unrelated parts of the codebase.

## Data and contracts

- Validate configuration and external inputs at system boundaries. Establish invariants early so internal code can rely on valid data.
- Avoid repeating defensive checks for conditions already guaranteed by those boundaries.
- Do not provide defaults for required environment variables. Fail explicitly when required configuration is missing.
- Make a value optional only when absence is a valid domain state.
- Keep data flow explicit. Avoid hidden global state, implicit mutation, and invisible dependencies.

## Functions and interfaces

- Give each function one coherent operation and a clear contract. Make its inputs, outputs, dependencies, and side effects explicit.
- Accept only the data a function needs. Prefer narrow parameters or a purpose-built type over a large object.
- Avoid pass-through wrappers unless they establish a meaningful boundary or contract.
- Use clear names and structure to explain the code. Add comments only to explain decisions, constraints, or complex behaviour that the code alone does not make clear.

## Errors and observability

- Fail immediately and explicitly when an internal invariant is violated. Do not silently recover from states that should be impossible.
- Handle expected invalid inputs and operational failures through explicit error paths.
- Handle errors at the layer that can act on them. Do not catch exceptions only to suppress or rethrow them unchanged.
- Prefer deterministic behaviour. Avoid implicit fallbacks and hidden recovery paths.
- Use structured logs with consistent fields and enough context to diagnose problems.
- Log meaningful operations, state transitions, external calls, and failures. Avoid noisy logs for trivial internal steps.
- Never log secrets, credentials, or sensitive payloads.

## Change scope and verification

- Read the affected code, callers, and tests before editing. Look for existing implementations before adding new ones.
- When extending a feature, choose the approach that keeps the design simplest.
- Prefer a principled rewrite of the affected responsibility over patches that add complexity. Preserve unrelated behaviour.
- Preserve public contracts unless the requested change requires breaking them. Make compatibility changes explicit.
- Add or update tests for changed behaviour. Test observable outcomes rather than implementation details.
- Run relevant tests, formatting, linting, and type checks using the project's tooling. Report any checks you could not run or that failed.
- Review the final diff for unrelated changes, obsolete code, and accidental complexity.
