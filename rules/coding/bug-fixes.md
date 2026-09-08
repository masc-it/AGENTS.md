# Bug fixes

- Reproduce the bug or establish a reliable failing case before changing code. If you cannot reproduce it, state what evidence you have and what remains uncertain.
- Trace the failure to its cause. Check whether the same cause affects other callers or paths within the affected responsibility.
- Add a regression test that fails before the fix and passes after it. If an automated test is not practical, document a repeatable manual check.
- Verify the original failure and nearby behaviour after the fix.
