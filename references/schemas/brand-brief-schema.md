# Brand Brief Schema (brand-brief.md)

The brand-brief.md is the smart manifest that connects all skills. It uses YAML frontmatter for machine-readable state and a markdown body for human-readable context. Every skill reads from and writes to this file.

---

## Full YAML Schema

```yaml
---
# ===== IDENTITY =====
project: null          # Project name (e.g., "DevClose", "FitEvol")
codename: null         # Internal codename if different from brand name
brand_name: null       # The actual brand name (may be TBD)
codebase: null         # Path to the project's codebase (e.g., "E:/Projects/devclose")
vault_path: null       # Path to vault brand file (e.g., "~/vault/brands/myproject.md" or Obsidian vault path)

# ===== LIFECYCLE =====
stage: seed            # Current stage in brand lifecycle
  # Valid values:
  #   seed         - Just an idea, no brand work done
  #   positioning  - Working on positioning
  #   messaging    - Working on messaging (positioning at least draft)
  #   voice        - Working on voice (messaging at least draft)
  #   visual       - Working on visual identity (voice at least draft)
  #   launch       - Brand assets being deployed
  #   growth       - Brand in market, iterating
  #   rebrand      - Existing brand being overhauled (restarts at positioning)
created: null          # ISO date: 2026-03-18
last_updated: null     # ISO date: auto-updated by skills
last_audit: null       # ISO date: last time brand-audit ran

# ===== BUSINESS CONTEXT =====
business_type: null    # Informs framework adaptations
  # Valid values: saas | local_service | content_creator | ecommerce | agency | community | other
industry: null         # Freeform string (e.g., "developer tools", "fitness", "home services")
target_audience: null  # Brief audience description (detailed in positioning.best_fit_customers)

# ===== POSITIONING (Dunford Framework) =====
positioning:
  status: not_started  # not_started | in_progress | draft | complete | needs_refresh | deferred
  confidence: {}       # Per-component confidence scoring (see below)
  competitive_alternatives: []
    # Each item: { name: string, type: "direct|indirect|status_quo", notes: string }
  unique_attributes: []
    # Each item: { attribute: string, category: "feature|model|process|ip|partnership|other" }
  value: []
    # Each item: { value: string, tied_to: [attribute_names], for_whom: string }
  best_fit_customers: []
    # Each item: { segment: string, characteristics: [], why_they_care: string }
  market_category: null
    # { category: string, style: "existing_niche|existing_head_to_head|new_category", rationale: string }
  onlyness_statement: null  # Neumeier format: "The only [category] that [benefit]"
  positioning_statement: null  # Full positioning narrative (human-readable)

  # Confidence scoring per component
  # Valid values: validated | researched | assumed
  # "validated" = backed by real customer/market data
  # "researched" = backed by desk research (web search, forums, etc.)
  # "assumed" = educated guess, needs validation
  # Example: { competitive_alternatives: "researched", unique_attributes: "validated", value: "assumed" }

# ===== MESSAGING (Miller StoryBrand) =====
messaging:
  status: not_started  # not_started | in_progress | draft | complete | needs_refresh
  brandscript:
    character: null          # Who is the customer and what do they want?
    problem:
      villain: null          # The root cause they're fighting
      external: null         # The tangible problem
      internal: null         # How it makes them feel
      philosophical: null    # Why it's wrong
    guide:
      empathy: null          # How you understand their problem
      authority: null        # Why you're qualified to help
    plan: []                 # 3-step plan (array of strings)
    cta:
      direct: null           # Primary action
      transitional: null     # Lower-commitment action
    success: null            # What life looks like after transformation
    failure: null            # What they lose by not acting
    transformation: null     # "From [before] to [after]"
  tagline: null              # External-facing tagline
  trueline: null             # Internal truth statement (Neumeier)
  elevator_pitch: null       # 30-second pitch

# ===== VOICE (NN/g + Aaker + Jung) =====
voice:
  status: not_started  # not_started | in_progress | draft | complete | needs_refresh
  dimensions:
    funny_serious: null           # -3 to +3
    formal_casual: null           # -3 to +3
    respectful_irreverent: null   # -3 to +3
    enthusiastic_matter_of_fact: null  # -3 to +3
  personality: null    # Primary Aaker dimension: sincerity | excitement | competence | sophistication | ruggedness
  personality_secondary: null  # Optional secondary dimension
  archetype: null      # Jung archetype: innocent | explorer | sage | hero | outlaw | magician | regular | lover | jester | caregiver | creator | ruler
  sounds_like: []      # 2-3 reference voices (e.g., "a smart friend who works in the industry")
  not_like: []         # 2-3 anti-references (e.g., "a corporate press release")
  vocabulary:
    use: []            # Words that embody the voice
    avoid: []          # Words that contradict the voice (includes anti-slop banned list)
  examples:
    on_brand: []       # Array of { context: string, text: string }
    off_brand: []      # Array of { context: string, text: string, why_wrong: string }

# ===== VISUAL IDENTITY (Chris Do Stylescapes) =====
visual:
  status: not_started  # not_started | in_progress | draft | complete | needs_refresh
  chosen_direction: null  # Which of the 3 directions was selected
  directions: []       # Array of stylescape descriptions (up to 3)
    # Each: { name: string, description: string, personality: string }
  colors:
    primary: null      # { hex: string, name: string, usage: string }
    secondary: null    # { hex: string, name: string, usage: string }
    accent: null       # { hex: string, name: string, usage: string }
    neutrals: []       # Array of { hex: string, usage: string }
    palette_rationale: null  # Why these colors, tied to strategy
  typography:
    heading: null      # { family: string, weight: string, style: string }
    body: null         # { family: string, weight: string, style: string }
    mono: null         # Optional: { family: string } for code/technical brands
    pairing_rationale: null  # Why this pairing, tied to personality
  imagery_style: null  # Photography/illustration guidelines
  icon_style: null     # Icon design guidelines
  logo_direction: null # Logo concept direction (not final logo)

# ===== ASSET INVENTORY =====
assets:
  existing: []
    # Each: { type: string, location: string, intentionality: 1-5, consistency: 1-5, quality: 1-5, notes: string }
    # Types: logo | colors | fonts | tagline | meta_description | og_image | favicon | readme_copy | social_bio | css_theme | brand_guide
  gaps: []
    # Each: { type: string, priority: "critical|important|nice_to_have", recommendation: string }
  inconsistencies: []
    # Each: { description: string, locations: [], severity: "high|medium|low" }

# ===== INTELLIGENCE =====
intelligence:
  competitors: []
    # Each: { name: string, url: string, positioning_summary: string, strengths: [], weaknesses: [], last_scanned: date }
  inspiration: []
    # Each: { name: string, url: string, what_to_learn: string, date_captured: date }
  last_scan: null  # ISO date
---
```

---

## State Machine

```
seed → positioning → messaging → voice → visual → launch → growth
                                                            ↓
                                                         rebrand → positioning (restarts)
```

**Progression rules:**
- Skills WARN when prerequisites are incomplete, but never BLOCK
- If a user wants to skip ahead, explain what they're missing and proceed
- Downstream skills flag confidence: "This messaging is built on assumed positioning"

**Stage transitions:**
- `seed → positioning`: When user starts positioning work
- `positioning → messaging`: When positioning.status reaches "draft" or "complete"
- `messaging → voice`: When messaging.status reaches "draft" or "complete"
- `voice → visual`: When voice.status reaches "draft" or "complete"
- `visual → launch`: When all four (positioning, messaging, voice, visual) are at least "draft"
- `launch → growth`: When brand is deployed in market
- `growth → rebrand`: User-initiated, resets to positioning stage

---

## Confidence Tracking

Each positioning component is scored independently:

| Level | Meaning | Downstream Impact |
|-------|---------|-------------------|
| `validated` | Backed by real customer data, sales conversations, or market testing | Full confidence in downstream work |
| `researched` | Backed by desk research: web search, forums, competitor analysis | Downstream work is "research-grade" |
| `assumed` | Educated guess based on founder intuition or limited data | Downstream work flagged as "hypothesis-grade" |

Skills that consume positioning data must acknowledge the confidence level:
- brand-messaging built on `assumed` positioning → output flagged as "hypothesis-grade messaging, revisit after customer validation"
- brand-voice built on `validated` positioning → output is production-ready

---

## Discovery Chain (How Skills Find brand-brief.md)

All skills follow this chain:

1. Check current working directory for `brand-brief.md`
2. Check `codebase` path (if set in an existing brief) for `brand-brief.md`
3. Check `vault_path` if set in an existing brief
4. If none found, check if `start` should create one
5. If multiple found, use the most recently updated (`last_updated` field)

---

## Read/Write Contract

| Skill | Reads | Writes |
|-------|-------|--------|
| start | Everything (to assess state) | Identity, lifecycle, business_type |
| brand-positioning | identity, business_type, positioning | positioning (all fields), stage, last_updated |
| brand-audit | identity, business_type, assets | assets (all fields), last_audit, last_updated |
| brand-messaging | identity, business_type, positioning | messaging (all fields), stage, last_updated |
| brand-voice | identity, business_type, positioning, messaging | voice (all fields), stage, last_updated |
| brand-visual-identity | identity, business_type, positioning, messaging, voice | visual (all fields), stage, last_updated |
| brand-competitor-scan | identity, positioning | intelligence.competitors, intelligence.last_scan |
| brand-sync | Everything | vault_path, last_updated |

---

## Markdown Body Structure

Below the YAML frontmatter, the markdown body contains human-readable context:

```markdown
## Brand Story

[Human-readable narrative about the brand's journey, key decisions, and rationale]

## Decision Log

### [Date] - [Decision]
[Context and rationale for major brand decisions]

## Notes

[Freeform notes, context, ideas that don't fit in structured fields]
```

The body is preserved across skill updates. Skills append to the Decision Log when making significant changes.
