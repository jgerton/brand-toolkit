# Brand Toolkit

A Claude Code plugin for methodology-grounded brand building. Positioning, messaging, voice, visual identity, audit, and competitive analysis powered by proven expert frameworks.

## The Problem

Existing brand tools are siloed SaaS products that produce generic output. They don't adapt to your business type, can't integrate into a developer's workflow, and treat branding as a fill-in-the-blank exercise.

Brand Toolkit composes proven expert frameworks into Claude Code skills that share state via a smart manifest, adapt to your knowledge level, and produce distinctive, specific output.

## Frameworks

| Area | Framework | Expert |
|------|-----------|--------|
| Positioning | 5-component positioning | April Dunford |
| Differentiation | Onlyness test | Marty Neumeier |
| Messaging | 7-element BrandScript | Donald Miller |
| Voice | 4 voice dimensions | Nielsen Norman Group |
| Personality | Brand personality model | David Aaker |
| Visual | Stylescapes methodology | Chris Do |

## Get Started

Clone it, point Claude Code at it, run `/brand-toolkit:start`.

- [Installation guide](docs/INSTALLATION.md) - two install methods, takes 30 seconds
- [Getting started](docs/GETTING-STARTED.md) - your first brand positioning in 10 minutes

## Skills

### Core Workflow

| Skill | What it does |
|-------|-------------|
| `start` | Detects your context, finds or creates your brand brief, routes you to the right skill |
| `brand-positioning` | Dunford's 5-component framework + Neumeier's Onlyness test. Research-assisted discovery for users without market knowledge |
| `brand-messaging` | Miller's StoryBrand BrandScript. Customer as hero, brand as guide. Produces tagline and trueline |
| `brand-voice` | NN/g voice dimensions + Aaker personality + Jung archetypes. Produces on-brand vs off-brand examples |
| `brand-visual-identity` | Chris Do's Stylescapes. 3 contrasting visual directions with color, typography, and imagery rationale |
| `brand-audit` | Scans codebases and websites for existing brand assets. Scores intentionality, consistency, and quality |

### Intelligence

| Skill | What it does |
|-------|-------------|
| `brand-competitor-scan` | Analyzes competitors through all framework lenses. Identifies positioning white space |
| `brand-radar` | Passive intelligence capture. Log competitors and inspiration with brand-lens analysis |

### Execution

| Skill | What it does |
|-------|-------------|
| `brand-landing-page` | Conversion-focused page design from your full brand brief |
| `brand-ad-copy` | Platform-specific copy (Google Ads, social, email) with voice consistency |

### Commands

| Command | What it does |
|---------|-------------|
| `brand-sync` | Sync your brand brief between project directory and vault |

## How It Works

### Smart Manifest (brand-brief.md)

Every skill reads from and writes to a single `brand-brief.md` file with YAML frontmatter. This is the connective tissue between skills.

```
seed -> positioning -> messaging -> voice -> visual -> launch -> growth
```

Skills warn when prerequisites are incomplete but never block you. Downstream skills flag confidence: "This messaging is built on assumed positioning."

### Confidence Tracking

Each positioning component is scored independently:

- **validated**: backed by real customer data
- **researched**: backed by desk research
- **assumed**: educated guess, needs validation

### Adaptive Interactivity

Skills assess how much context you provide and choose guided or fast mode automatically. You always get transparency about why and can override.

### Anti-Slop by Design

Every skill runs output through checks:

- **Swap test**: could a competitor claim this?
- **Specificity test**: any banned generic words ("innovative", "cutting-edge")?
- **Differentiation test**: is value tied to specific unique attributes?
- **Business-type test**: would this work for both a lawn care company and a SaaS? If yes, too generic.

## Three User Journeys

1. **New idea, no brand assets**: Start routes you to positioning (or market research if you need validation first)
2. **Existing business, scattered assets**: Start routes you to brand-audit to discover what you have
3. **Established brand, needs refresh**: Start detects your existing brief and recommends next actions

## Works With

Brand Toolkit has soft dependencies on these skills from [claude-skills](https://github.com/jgerton/claude-skills) (works without them, better with them):

- [`market-researcher`](https://github.com/jgerton/claude-skills/tree/master/market-researcher): Problem validation and competitive landscape
- [`ideation-expert`](https://github.com/jgerton/claude-skills/tree/master/ideation-expert): Idea stress-testing with brand-brief awareness

## License

MIT
