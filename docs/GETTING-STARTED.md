# Let's build something. Install done? Here's what happens next.

---

## What you just installed

Ten skills that share a single file. That's the whole architecture.

Every skill reads from and writes to `brand-brief.md` in your project directory. Positioning fills in fields. Messaging reads those fields and fills in more. Voice reads messaging. Visual identity reads all of it. The brief is the memory that makes skills feel connected instead of isolated.

**The natural order:** positioning → messaging → voice → visual identity. You can skip around, and the skills won't stop you. They'll just flag what's missing so you know what you're working with.

**The frameworks underneath:**
- Positioning: April Dunford's 5-component framework from *Obviously Awesome*
- Messaging: Donald Miller's StoryBrand BrandScript
- Voice: NN/g's brand voice dimensions + Aaker personality + Jung archetypes
- Visual identity: Chris Do's stylescape method

These aren't "AI interprets the concept of positioning." The skill literally works through Dunford's five components in the order she specifies, because the order matters.

**One more thing:** `brand-sync` keeps your brief in sync across projects. Run it when you're working across a codebase and a separate brand directory.

**The anti-slop system:** Every skill checks its own output against real quality criteria before showing it to you. If it could belong to your competitor, it gets flagged and rewritten. More on this below.

---

## Your first run

Open any project directory. Run `/brand-toolkit:start`.

```
/brand-toolkit:start
```

The skill looks for an existing `brand-brief.md` first. It checks your current directory, your codebase path, and your vault if you use one.

**If it finds a brief,** it reads the whole thing and gives you a status summary:

```
Your brand brief is at the positioning stage.
- Positioning: draft (competitive_alternatives: researched, unique_attributes: assumed)
- Messaging: not started
- Voice: not started
- Visual: not started

Recommended next step: brand-messaging, because your positioning is draft-ready.
Before that, consider: validating your best-fit customers assumption with 3-5 customer conversations.
Alternative: brand-positioning refresh if the market has shifted since you last ran this.
```

**If it finds nothing,** it asks three quick questions (project name, business type, one-sentence description) and routes you based on where you are:

- **New idea, no brand assets** → routes to positioning, or offers to validate the idea first if you haven't talked to anyone yet
- **Existing business, scattered assets** → routes to brand-audit to inventory what you have before building on it
- **Established brand, needs refresh** → creates a seed brief with what you tell it, then walks you to positioning

The skill adapts to how much you front-load. If you say "I have a SaaS at E:/Projects/myapp, we have a website but no consistent brand," it skips the questions and acts on what you gave it. If you say "help me with branding," it goes guided mode and tells you why.

---

## Walk-through: building your positioning

This is where the real work starts. Run `brand-positioning` after `/brand-toolkit:start` sets up your brief.

### The skill picks its mode based on what you know

It reads your brief and signals from the conversation, then announces what it's doing and why.

**Zero knowledge:**
> "I'm going research-assisted because you're early stage. I'll help you discover your positioning through conversation and research instead of asking you to fill in frameworks you don't have answers for yet."

It starts with the problem, not the framework. "What frustration made you think of building this?" is easier to answer than "list your competitive alternatives." The Dunford components emerge from the conversation. You don't fill in a form.

**Some knowledge:**
> "You have some positioning pieces already. I'll walk through Dunford's 5 components and fill the gaps."

It validates what exists (running anti-slop checks on the data already in your brief), researches the gaps, and connects the components.

**Rich knowledge:**
> "You've got a solid foundation. I'll validate your positioning against Dunford's framework and run the Onlyness test."

Fast mode. Maps what you know to the five components, finds weak links, runs the quality checks, done.

You can override: "Want me to switch to research-assisted? Here's why I chose this mode."

### Dunford's five positioning components

Dunford's framework runs in this order. The order isn't arbitrary. Each component depends on the one before it.

**1. Competitive alternatives** — What would your customers do if you didn't exist? Not what other companies theoretically compete with you. What your customers actually do today. This includes "nothing" as a valid answer. "Do nothing / keep using spreadsheets" is often the real competition.

It asks what your customers would do if you didn't exist. Not hypothetically. Actually.

**2. Unique attributes** — What do you have that those alternatives don't? Features, business model, process, expertise, partnerships. At this stage, no judging. Just listing.

**3. Value** — So what? For each attribute: what does that do for customers? This is where "saves time" gets replaced with "eliminates 6 hours/week of manual data entry." Every value claim gets anchored to a specific attribute. Claims that float get cut.

**4. Best-fit customers** — Who cares about that value MORE than anyone else? Not "small businesses." Which small businesses? What situation puts them in the "will buy fast and rarely ask for discounts" category? That's your target.

**5. Market category** — What frame of reference makes your value obvious the moment someone hears it? The skill generates 2-3 candidate categories and evaluates each: does this category highlight your differentiated value, or does it hide it? It recommends one with a reason.

### Anti-slop in action

After each component, and on the final output, the skill runs a battery of checks.

The core one is the swap test: could a competitor claim this?

If your value proposition is "we provide innovative solutions that empower teams to do their best work," that's a swap test failure. Every software company on earth could claim that. The skill flags it, tells you which test it failed, and helps you find what's actually specific to you.

Here's what a revision looks like:

> "I revised this because it failed the swap test. 'We help teams work better together' could be anyone. Your actual differentiator is that you auto-resolve scheduling conflicts across time zones without manual input — no other tool in this category does that without add-ons. Let's use that."

The specificity test catches the banned-words list: innovative, cutting-edge, leverage, empower, seamless, revolutionary, synergy, holistic. When these appear, the skill replaces them with the concrete thing they were hiding.

### The Onlyness statement

At the end of positioning, the skill runs Marty Neumeier's Onlyness test. It forces you to complete this sentence:

```
Our [offering] is the only [category] that [benefit].
```

If you can't complete it with something specific — something a competitor genuinely can't claim — your positioning has a gap. The skill finds it with you.

The extended version answers six questions: what, how, who, where, when, why. This becomes your Trueline: the one true thing about the brand that no competitor can honestly say.

---

## What's in your brand-brief.md now

After positioning runs, your `brand-brief.md` has structured YAML with all five components filled in. Here's what part of it looks like:

```yaml
positioning:
  status: draft
  confidence:
    competitive_alternatives: researched
    unique_attributes: researched
    value: assumed
    best_fit_customers: assumed
    market_category: assumed
  competitive_alternatives:
    - { name: "Spreadsheets + gut feeling", type: status_quo, notes: "What most early founders actually do" }
    - { name: "Generic AI branding tools", type: indirect, notes: "Produce output anyone could claim" }
  unique_attributes:
    - { attribute: "Framework-driven positioning, not fill-in-the-blank", category: process }
  onlyness_statement: "The only brand toolkit that runs real expert frameworks and checks its own output for generic slop."
```

Each component carries a confidence score:

- **validated** — backed by real customer data, sales conversations, or market testing
- **researched** — backed by desk research: web search, forums, competitor analysis
- **assumed** — educated guess, needs validation before you build on it

The confidence scoring is the honesty layer. It tells you what's solid and what's still a guess. Downstream skills read these scores and flag accordingly. Messaging built on `assumed` positioning gets marked "hypothesis-grade." Messaging built on `validated` positioning is production-ready.

Skills warn when prerequisites are shaky. They don't stop you.

If you run messaging before positioning is done, it proceeds and flags everything downstream: "This messaging is built on assumed positioning. Revisit after customer validation." You can keep moving without losing the work.

---

## What's next

Run these in order. Each one reads the output of the one before it.

**Messaging** (`brand-messaging`) — Donald Miller's StoryBrand BrandScript. Your brand story, tagline, elevator pitch, and calls to action. It reads your positioning to understand who the hero is, what they're fighting, and where you fit as the guide.

**Voice** (`brand-voice`) — NN/g's four voice dimensions, Aaker brand personality, and Jung archetypes. It produces your voice profile with numeric dimensions, on-brand examples, and explicit "not like" statements. Voice without contrast is voice without edges, so the skill forces the contrast.

**Visual identity** (`brand-visual-identity`) — Chris Do's stylescape method. Three contrasting visual directions with different personalities, each tied back to your positioning and voice. You choose one (or none, with feedback), and the skill documents the rationale.

Each skill builds on the last. Your positioning informs your messaging. Your messaging shapes your voice. Your voice guides your visuals.

Skip one and the downstream skills flag it. They don't gatekeep. They just make sure you know what you're building on.

---

## Quick reference

| Skill | What it does | Framework |
|-------|-------------|-----------|
| `/brand-toolkit:start` | Detects where you are, routes you | State machine |
| `brand-positioning` | Establishes your unique position | Dunford 5-component + Neumeier Onlyness |
| `brand-messaging` | Brand story, tagline, pitch | Miller StoryBrand |
| `brand-voice` | How your brand talks | NN/g + Aaker + Jung |
| `brand-visual-identity` | 3 visual directions | Chris Do Stylescapes |
| `brand-audit` | Inventories existing brand assets | Structured scoring |
| `brand-competitor-scan` | Ongoing competitive intelligence | Dunford alternatives |
| `brand-radar` | Passive intelligence capture | Brand-lens analysis |
| `brand-landing-page` | Conversion-focused page from brief | Full brief synthesis |
| `brand-ad-copy` | Platform-specific copy | Voice consistency |

Plus `brand-sync` (command) to keep your brief in sync across project directories.

Everything writes to `brand-brief.md`. One file, full picture, all skills talking to each other.
