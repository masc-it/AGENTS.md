#!/usr/bin/env bash
# Ask a fresh pi instance to review a document draft as its intended reader.
# Usage: review.sh <brief.md> <draft-file> [round-number]
# Prints the review to stdout. Uses the current session's model when PI_PROVIDER/PI_MODEL are set.
set -euo pipefail

brief=${1:?usage: review.sh <brief.md> <draft-file> [round]}
draft=${2:?usage: review.sh <brief.md> <draft-file> [round]}
round=${3:-1}
here=$(cd "$(dirname "$0")" && pwd)
rules="$HOME/.agents/rules/docs/writing.md"

for f in "$brief" "$draft" "$rules" "$here/reviewer-prompt.md"; do
  [[ -f $f ]] || { echo "review.sh: missing file: $f" >&2; exit 1; }
done

model_args=()
if [[ -n ${PI_PROVIDER:-} && -n ${PI_MODEL:-} ]]; then
  model_args=(--model "$PI_PROVIDER/$PI_MODEL")
fi
if [[ -n ${PI_REASONING_LEVEL:-} ]]; then
  model_args+=(--thinking "$PI_REASONING_LEVEL")
fi

# Build the prompt: reviewer instructions with the writing rules injected in place of {{WRITING_RULES}}.
prompt=$(RULES_FILE="$rules" python3 -c '
import os, sys
template = sys.stdin.read()
rules = open(os.environ["RULES_FILE"]).read()
sys.stdout.write(template.replace("{{WRITING_RULES}}", rules.strip()))
' < "$here/reviewer-prompt.md")

# The reviewer sees only the prompt, the brief, and the draft: no project files, skills, or tools.
pi -p --no-session --no-context-files --no-skills --no-extensions --no-mcp --no-tools \
  "${model_args[@]}" \
  "@$brief" "@$draft" \
  "$prompt

This is review round $round."
