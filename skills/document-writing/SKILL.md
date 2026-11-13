---
name: document-writing
description: Write or revise a document, such as a README, guide, report, summary, product overview, plan, marketing text, or a pre-formatted Slack message, through a draft, fact-check, fresh-reader review, and revision process. Use when the user asks for a document or a file of prose. Not needed for ordinary chat replies.
---

# Document writing

Every step below works on files. Drafts, briefs, and reviews are saved to disk, and every revision is an edit to the saved document. Don't keep a draft in your head and write only the final version.

The style rules are in `~/.agents/rules/docs/writing.md`. Read them before you start if you haven't in this session. The steps below call them "the writing rules".

## Step 1: Write the brief

Create a working folder for this document with `mktemp -d /tmp/document-writing.XXXXXX`, and save `brief.md` in it with:

- **Kind of text:** technical doc, non-technical doc, marketing, or Slack message, as defined in "Understanding level of detail" in the writing rules.
- **Reader:** who will read it and what they already know.
- **Purpose:** what the reader should know, decide, or do after reading.
- **User requests:** the user's request in their own words, plus any length, format, tone, or points to cover or avoid. These override the writing rules when they conflict.

The reviewer in step 4 sees only this brief, the writing rules, and the draft. Write the brief so that someone who hasn't seen the conversation can judge the draft from it.

## Step 2: Research and draft

Collect the material the document is about: files, docs, conversation, git history, or data. Then write a complete first draft and save it to the output path. If the user gave no path, save it as `draft.md` in the working folder.

## Step 3: Check facts against the sources

Reread the saved draft from disk. For each claim:

1. Find the source that supports it. Check code or recent commits when docs might be out of date.
2. Correct claims the sources contradict, and remove claims you can't support.
3. Look for context you haven't used yet, such as related files, recent changes, or earlier decisions, and add what the reader needs.

A verified fact isn't automatically relevant. Before adding one, check it against the level of detail for this kind of text.

Edit the saved file with your changes. Keep a short list of claims you couldn't verify and of contradictions between sources, for step 6.

## Step 4: Get a fresh reader's review

Run the reviewer on the saved draft:

```bash
~/.agents/skills/document-writing/scripts/review.sh <working-folder>/brief.md <draft-path> 1 > <working-folder>/review-1.md
```

The script runs a separate pi instance that sees only the writing rules, the brief, and the draft. It reads the draft as the intended reader and returns a numbered list of problems. Then read `review-1.md`.

## Step 5: Revise

Go through the review item by item, and edit the saved file for each one you accept. The reviewer can't see the sources, so check its suggestions against them: don't add a fact, example, or shortcut it proposes unless the sources support it. Skip an item only when it's wrong or conflicts with the user's requests.

If the review had more than five accepted items, or if your edits rewrote whole sections, run the reviewer again on the revised file as round 2, then round 3 if needed, and revise each time. Stop when a review returns "No problems found", or when it lists only items you've decided to skip. Don't run more than three rounds.

Then reread the whole saved file one last time and check that:

- the first sentence says the main thing the reader can do or learn
- the level of detail fits the kind of text and the reader in the brief
- there are no benefit clauses, praise words, meta sentences about the document, or vague caveats
- every fact still matches its source after the rewording
- the text sounds like a person wrote it, read as if aloud

## Step 6: Deliver

Tell the user, in a few sentences:

- where the document is
- what it covers, if that isn't obvious from the request
- the claims you couldn't verify and the contradictions you found between sources, or that there were none
- any open questions for the user

Don't paste drafts or reviews into the reply unless the user asks. They stay in the working folder.
