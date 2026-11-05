# Writing rules

Apply all guidelines below to technical explanations and nontechnical writing, including product overviews and business recommendations.

When writing any document, make sure to follow these good practices and do at least a double pass on them to make sure the quality of the output is up to our standards. Documentation is very important and we must always double check it.

## Use simple English, clear sentences, and direct instructions

- Bad: "Utilize the configuration interface to facilitate modification of the timeout parameter."
- Good: "Set the timeout in the configuration file."

- Bad: "It is recommended that a restart of the service be performed following changes."
- Good: "Restart the service after changing the configuration."

- Bad: "The proposed capability enables consumers to monitor pricing fluctuations for frequently purchased grocery items."
- Good: "The proposed feature lets shoppers track prices for groceries they buy regularly."

## Keep the signal-to-noise ratio high

Every sentence should help the reader understand, decide, or act. Remove filler, repetition, obvious observations, and details that do not affect the topic. Keep necessary context and caveats. Aim for useful information, not just fewer words.

- Bad: "Product categorization plays an important role in the overall shopping experience. It is worth noting that incorrect categories can have a negative impact on the relevance of the offers that shoppers see in search results."
- Good: "Incorrect categories can make unrelated offers appear in search results and relevant offers harder to find."

- Bad: "When considering the use of historical categories, there are some important data quality considerations to keep in mind. We should not necessarily assume that all existing categories are accurate and suitable for use."
- Good: "Historical categories may be model predictions rather than human-checked labels. Check their accuracy before using them to train or evaluate models."

- Bad: "When discussing potential future activities, it is important to keep in mind that expressing interest in an activity does not necessarily mean that a commitment has been made to deliver it."
- Good: "AutoCat is a possible next activity. Its scope, ownership, and delivery commitment remain unconfirmed."

## Avoid "not X but Y" punchlines

- Bad: "This is not just a cache, but a performance revolution."
- Good: "The cache reduces repeated database queries."

- Bad: "This is not about adding checks; it is about building trust."
- Good: "These checks reject invalid input before it reaches the database."

- Bad: "Price tracking is not just a way to find discounts; it is a reason to keep coming back."
- Good: "Price alerts could encourage shoppers to return when products they regularly buy go on sale."

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

## Define scope, interfaces, data shapes, ownership, and failure behavior explicitly

- Bad: "The endpoint accepts user data and handles errors."
- Good: "POST /users creates one user from a JSON object with a required string field, email. The identity team owns the endpoint. It returns 201 with {id, email}, or 409 if the email already exists."

- Bad: "The worker processes uploaded files and retries failures."
- Good: "The import worker handles CSV uploads only. It consumes queue messages shaped as {upload_id: string, object_key: string}. The data team owns it. Failed imports retry three times, then move to the dead-letter queue."

- Bad: "Product Enablement handles matching and supports the teams that use it."
- Good: "Product Enablement supplies product-matching capabilities. Each business unit remains responsible for its product and business results. Responsibility for manual checks and cases where matching fails still needs to be agreed."

## Avoid UTF-8 glyphs that aren't normally available on a standard keyboard

The bad examples below intentionally include the characters to avoid.

- Bad: "Open Settings → Network → Proxy."
- Good: "Open Settings > Network > Proxy."

- Bad: "Set the timeout to ≤ 30 seconds…"
- Good: "Set the timeout to at most 30 seconds."

- Bad: "Running low on coffee? → Check this week’s offers."
- Good: "Running low on coffee? Check this week's offers."
