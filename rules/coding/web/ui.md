# Web UI

- Use shared styles or components for repeated UI elements such as buttons, tables, and form controls. Keep their appearance and behaviour consistent.
- Design around the user's task. Identify what they need to accomplish before arranging components.
- Prefer minimalism and clear labels. Remove redundant prose without hiding necessary labels, controls, or context. Favor recognition over memorization.
- Prefer familiar interaction patterns. Introduce novelty only when it improves the task rather than forcing users to relearn controls.
- Respect the user's intelligence. Avoid repetitive labels, verbose prose, and explanations of obvious interactions.
- Treat the user as a senior designer. Deliver deliberate hierarchy, precise spacing, consistent typography, and polished interactions.
- Make the primary action unmistakable. Use visual hierarchy and progressive disclosure to keep secondary controls out of the way until needed.
- Use a restrained type scale, consistent spacing, and purposeful alignment. Let whitespace group content instead of adding unnecessary borders or containers.
- Use color sparingly to communicate meaning. Maintain readable contrast and never rely on color alone to convey state.
- Make interactions feel direct and predictable. Provide immediate feedback, preserve context, and make destructive actions recoverable where possible.
- Prevent errors with sensible defaults and appropriate constraints. Preserve entered values after failures, explain how to recover, and support undo where possible.
- Support expert efficiency with discoverable keyboard shortcuts and efficient repeated actions without cluttering the default view.
- Use motion only to explain state changes or spatial relationships. Keep it subtle and respect reduced-motion preferences.
- Design loading, empty, error, disabled, and success states with the same care as the default view.
- Treat layout stability as a core requirement. Reserve space for images, media, and asynchronous content; use skeletons that match the final geometry. Keep controls anchored during loading, validation, and state changes so content never unexpectedly jumps under the user's pointer or focus. Avoid font-loading shifts and animate with transforms or opacity rather than layout-changing properties where appropriate.
- Support keyboard navigation, visible focus, accessible names, and comfortable touch targets. Preserve hierarchy and usability across screen sizes.

## Validation and inspiration

- Validate complete flows with realistic content, slow networks, errors, and narrow screens. Do not judge quality only from polished default-state screenshots.
- Check layout stability during initial loading and subsequent interactions. Target CLS of 0.1 or less at the 75th percentile of page visits, but also fix disruptive shifts that the metric excludes.
- Judge effectiveness by task completion, mistakes, and recovery. Validate assumptions with real users when possible; visual polish alone is not evidence of usability.
- Study shipped interfaces and complete flows. Borrow the reasoning behind a reference rather than copying its decoration, and adapt patterns to the user's task and context.

### References

- [Usability heuristics](https://www.nngroup.com/articles/ten-usability-heuristics/): feedback, conventions, error prevention, and recognition over recall.
- [Government Design Principles](https://www.gov.uk/guidance/government-design-principles): user needs, simplicity, inclusive design, and iteration.
- [Optimize Cumulative Layout Shift](https://web.dev/articles/optimize-cls): diagnosing and preventing instability throughout the page lifecycle.
- [Mobbin](https://mobbin.com/): shipped interfaces and complete flows; some access requires a subscription.
- [Interface In Game](https://interfaceingame.com/): inspiration for information-dense interfaces and contextual controls.

## Review before completion

Before wrapping up any UI/UX activity, ask yourself:

1. Am I insulting the user's intelligence with repeated or verbose labels or prose?
2. Would this work insult the design judgment of a senior designer?

If either answer is yes, iterate on the design and repeat this review before finishing.
