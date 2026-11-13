# Writing rules

Apply these rules to all prose: technical docs, product overviews, business recommendations, PR descriptions, and chat answers.

Write for a smart colleague who hasn't seen the work. The text should read as if a careful person wrote it for that colleague.

When writing a document, follow the `document-writing` skill in `~/.agents/skills/document-writing/SKILL.md`.

## Lead with what matters

Start with the main point. Spend the most words on what the reader needs most, and keep minor points short. Sections don't need equal length or the same shape.

- Bad: "Tally is an application that brings expense management into one place.", followed by six sections of equal length, each with two paragraphs and a closing caveat.
- Good: "Tally turns a photo of a receipt into an expense claim: you check the amount, pick a project, and submit. Approvals, reports, and card imports build on that."

- Bad: "This report covers the background, the methodology, the findings, and our recommendations."
- Good: "We should stop the March campaign. It cost 40,000 EUR and brought fewer sign-ups than the unpaid newsletter."

## Use simple English, clear sentences, and direct instructions

- Bad: "Utilize the configuration interface to facilitate modification of the timeout parameter."
- Good: "Set the timeout in the configuration file."

- Bad: "It is recommended that a restart of the service be performed following changes."
- Good: "Restart the service after changing the configuration."

- Bad: "The proposed capability enables consumers to monitor pricing fluctuations for frequently purchased grocery items."
- Good: "The proposed feature lets shoppers track prices for groceries they buy regularly."

## Write in a natural voice

Use contractions, active voice, and "you" when you address the reader. Say what the product does. Avoid framing every feature as "Users can..." or "X can be done".

- Bad: "Users can create and rename projects. Receipts can be uploaded using the mobile app."
- Good: "Each client gets its own project. You upload receipts from the mobile app."

- Bad: "It is not currently possible to submit more than one claim for the same receipt."
- Good: "You can only claim each receipt once."

## Keep the signal-to-noise ratio high

Every sentence should help the reader understand, decide, or act. Remove filler, repetition, obvious observations, and details that do not affect the topic. Keep necessary context and caveats. Aim for useful information, not just fewer words.

Cut clauses that explain a benefit the reader can work out alone, such as "so you can...", "making it easier to...", "helping you...", and "allowing...".

- Bad: "Product categorization plays an important role in the overall shopping experience. It is worth noting that incorrect categories can have a negative impact on the relevance of the offers that shoppers see in search results."
- Good: "Incorrect categories can make unrelated offers appear in search results and relevant offers harder to find."

- Bad: "Tally saves a draft of each claim as you type, making it easier to pick up where you left off without losing your changes."
- Good: "Tally saves a draft of each claim as you type."

- Bad: "When discussing potential future activities, it is important to keep in mind that expressing interest in an activity does not necessarily mean that a commitment has been made to deliver it."
- Good: "AutoCat is a possible next activity. Its scope, ownership, and delivery commitment remain unconfirmed."

## Understanding level of detail

Before writing, decide which kind of text you're producing. Each kind has a different reader and a different level of detail. Outside technical docs, leave out internal component names, libraries, algorithms, and code structure.

- **Technical docs**, such as READMEs, setup guides, architecture notes, and runbooks. The reader works on or with the system. Explain what the code can't show: what the system is for, how its parts fit together, why it was built this way, how to set it up and run it, and which constraints to respect. Don't restate what the code already says, such as parameters, defaults, error codes, or what a function does. Point to the file or symbol instead, because copied details go stale. See also [Avoid code-as-English prose](#avoid-code-as-english-prose).
- **Non-technical docs**, such as product overviews, reports, and business recommendations. The reader needs to understand what the product does or make a decision. Describe what it does, who it's for, its limits, costs, and open decisions. Leave out commands, file names, shortcuts, and numbers that don't affect the decision.
- **Marketing**, such as landing pages, announcements, and release highlights. The reader decides whether to care. Start with the reader's problem and what changes for them. Back each claim with one concrete fact. Keep it short, and state requirements the reader must know before trying.
- **Slack messages**, delivered pre-formatted in a fenced text block so they can be pasted as they are. The reader skims, often on a phone. Put the point or the request in the first line, and keep the message to about five short lines. Use Slack formatting: `*bold*`, `_italic_`, backticks for code, and `- ` for bullets. Slack doesn't render headings or tables. Mention people only when they need to act, and link to details instead of pasting them.

Here is the same feature written for each kind:

- Bad, outside technical docs: "Receipt photos go through the Tesseract OCR engine and are stored as WebP at 1600 pixels."
- Bad, technical: "`POST /receipts` accepts JPEG, PNG, or HEIC files up to 12 MB. Larger files return 413 with the error code `file_too_large`."
- Good, technical: "Uploads have a size limit so that text recognition finishes within the request timeout. The limit and its error response are defined in `api/receipts.py`."
- Good, non-technical: "Staff photograph a receipt, and Tally fills in the amount and date. Photos over 12 MB are rejected with a message."
- Good, marketing: "Snap a receipt. Tally fills in the amount and date."
- Good, Slack:

  ```text
  *Receipt scanning is live in Tally.*
  Take a photo of a receipt and the amount and date fill in automatically.
  Photos over 12 MB are rejected, so retake very large ones at a lower resolution.
  Questions or bugs: #tally-feedback
  ```

## Avoid contrast punchlines and imagined alternatives

Don't define something by what it isn't. This includes soft forms such as "rather than", "instead of", and "without X" when the reader never expected X. Keep a contrast only when readers would otherwise assume the alternative.

- Bad: "This is not just a cache, but a performance revolution."
- Good: "The cache reduces repeated database queries."

- Bad: "Price tracking is not just a way to find discounts; it is a reason to keep coming back."
- Good: "Price alerts could encourage shoppers to return when products they regularly buy go on sale."

- Bad: "Blurry receipts show a warning rather than failing silently."
- Good: "Blurry receipts show a warning and ask for a new photo."

- Good, because readers would expect the opposite: "Deleting a project archives its claims but doesn't delete them."

## Vary sentence length and let the content shape the structure

Mix short sentences with longer ones that connect ideas. In a paragraph of three or more sentences, include at least one short sentence of under 8 words and one longer sentence of over 20 words that links two ideas, for example with "because", "so", or "while". A run of sentences of the same length reads mechanically. Use bullets for separate, parallel items such as requirements, options, or steps. Use paragraphs for explanations, where each sentence builds on the one before.

- Bad: four one-line bullets: "Create projects.", "Search projects.", "Add receipts.", "Submit claims."
- Good: "Each client gets a project, which you can find by searching. Add receipts to it as you go, then submit them together as one claim."

- Good: "Backups run every night. The first one is slow because it copies every file, while later runs send only what changed since the previous night. Old snapshots are never deleted automatically."

## Start with the content and stop when you're done

Skip warm-up openings, praise for the question, and closing summaries that repeat the document. End after the last useful point.

- Bad: "In today's fast-paced world, managing expenses can be a real challenge."
- Good: "Tally turns receipt photos into expense claims."

- Bad: a final "In short" section: "Tally provides one place to capture receipts, submit claims, and track approvals."
- Good: end with the last section that adds information, such as the requirements and limits.

- Bad: "Great question! Here's an overview of how the retry logic works."
- Good: "Failed jobs retry three times, one minute apart, then move to the dead-letter queue."

## Write down decisions

When documenting a solution, state the chosen approach and why. Avoid leaving implementation choices unresolved with "A or B" wording. If a decision is still open, label it explicitly instead of presenting alternatives as a finished solution.

- Bad: "Store uploaded files in the database or in object storage, and keep a reference on the upload record."
- Good: "Store uploaded files in object storage and save the object key on the upload record. This keeps large files out of database backups."

- Bad: "Validate incoming requests in the API or in the worker, and return an error or retry when validation fails."
- Good: "Validate incoming requests in the API and reject invalid input with a 400 response before adding it to the queue. Do not retry validation failures; the caller must correct the input."

- Bad: "Launch price tracking as an app or a web app."
- Good: "Open decision: choose the launch format for price tracking. A web app would avoid app-store approval and could launch sooner."

## Avoid code-as-English prose

Explain behavior in natural language instead of translating code word for word. Keep exact identifiers when readers need them, such as in API references or instructions to change a specific field.

- Bad: "If `user.is_active == true` and `user.role != 'guest'`, return `True`."
- Good: "Allow access to active users who aren't guests."

- Bad: "The function iterates over `items` and appends each `item.name` to `names`."
- Good: "The function collects the item names."

- Bad: "If the shopper is inside the estimated repurchase window and the product has an active offer, trigger a notification."
- Good: "The proposed feature would alert shoppers when a product they may soon need is on sale."

## Start with building blocks, then combine them into complete flows

- Bad: "Configure the deployment pipeline, then learn what the build command and deployment token do."
- Good: "First, explain the build command and deployment token. Then show how the pipeline uses both to deploy the app."

- Bad: "The checkout flow validates a cart, charges a payment method, and creates an order; the next sections define those objects."
- Good: "Define the cart, payment method, and order first. Then explain how checkout validates the cart, charges the payment method, and creates the order."

- Bad: "The alert opens the flyer when a tracked product reaches its three-month low nearby; shoppers first need to choose products, and prices are tracked by retailer."
- Good: "Shoppers would choose products to follow. The service would track their prices by retailer and send an alert when a nearby store offers the lowest price in three months. The alert would open the store's flyer."

## Avoid UTF-8 glyphs that aren't normally available on a standard keyboard

This includes em dashes, en dashes, curly quotes, arrows, and the ellipsis character. The bad examples below intentionally include the characters to avoid.

- Bad: "Open Settings → Network → Proxy."
- Good: "Open Settings -> Network -> Proxy."

- Bad: "Set the timeout to ≤ 30 seconds…"
- Good: "Set the timeout to at most 30 seconds."

- Bad: "Tally includes reports—summaries of spending by project."
- Good: "Tally includes reports, summaries of spending by project."
