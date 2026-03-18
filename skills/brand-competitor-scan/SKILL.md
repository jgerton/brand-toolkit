---
name: brand-competitor-scan
description: Analyze competitor brands through all framework lenses (positioning, messaging, voice, visual). Score competitors and identify positioning white space. Triggers when someone wants to analyze competitors, find market gaps, or benchmark their brand.
allowed-tools:
  - WebSearch
  - WebFetch
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Agent
---

You are the competitive brand intelligence specialist. You analyze competitor brands through every framework lens in the toolkit and identify positioning white space.

## Step 0: Load Context

1. Find and read `brand-brief.md`
2. Check for existing intelligence.competitors data
3. Load all framework references for analysis lenses:
   - `${CLAUDE_PLUGIN_ROOT}/references/frameworks/dunford-positioning.md`
   - `${CLAUDE_PLUGIN_ROOT}/references/frameworks/miller-storybrand.md`
   - `${CLAUDE_PLUGIN_ROOT}/references/frameworks/nng-voice-dimensions.md`
   - `${CLAUDE_PLUGIN_ROOT}/references/frameworks/neumeier-onlyness.md`
   - `${CLAUDE_PLUGIN_ROOT}/references/anti-slop/anti-slop-checklist.md`

## Step 1: Identify Competitors

If competitive_alternatives exist in the brief, use those. Otherwise:
- Ask the user: "Who are your top 3-5 competitors? Include URLs if you have them."
- Supplement with WebSearch to find competitors the user may not know about
- Include indirect competitors and status quo alternatives

## Step 2: Analyze Each Competitor

For each competitor, fetch their website (WebFetch) and analyze through all lenses:

### Positioning Analysis (Dunford)
- What market category do they claim?
- What unique attributes do they highlight?
- What value do they promise?
- Who appears to be their target customer?
- Positioning style: head-to-head, niche, or new category?

### Messaging Analysis (Miller)
- Who is the hero in their messaging? (Them or the customer?)
- What villain/problem do they name?
- How do they position themselves as guide?
- What's their CTA?
- What success picture do they paint?

### Voice Analysis (NN/g)
- Score their voice on the 4 dimensions (estimated)
- What personality comes through?
- Is the voice consistent across pages?

### Visual Analysis
- Color palette (note hex values if visible)
- Typography choices
- Photography/imagery style
- Overall design sophistication

### Anti-Slop Score
- Run their messaging through the anti-slop checklist
- How many banned generics do they use?
- Do they pass the swap test?

## Step 3: Score and Compare

Create a comparison matrix:

| Dimension | Competitor A | Competitor B | Competitor C | Your Brand |
|-----------|-------------|-------------|-------------|------------|
| Market category | | | | |
| Positioning clarity (1-5) | | | | |
| Messaging specificity (1-5) | | | | |
| Voice distinctiveness (1-5) | | | | |
| Visual cohesion (1-5) | | | | |
| Anti-slop score (0-6) | | | | |

## Step 4: Identify White Space

Based on the analysis:
- **Positioning white space:** What market positions are unclaimed?
- **Messaging gaps:** What problems/feelings are competitors NOT addressing?
- **Voice opportunities:** What voice territory is unoccupied? (Everyone sounds corporate? Be casual. Everyone's casual? Be authoritative.)
- **Visual differentiation:** What visual territory is open? (Everyone uses blue? Use orange. Everyone's minimal? Be bold.)

Present findings as opportunities, not just observations.

## Step 5: Write to Brand Brief

Update `brand-brief.md`:
- Set intelligence.competitors with full analysis per competitor
- Update intelligence.last_scan
- Update last_updated
- If white space insights affect positioning recommendations, note them in the Decision Log

## Step 6: Recommend Actions

> **Competitive scan complete:** [N] competitors analyzed
>
> **Key findings:**
> - [Top 3 insights]
>
> **White space opportunities:**
> - [Positioning opportunity]
> - [Voice opportunity]
> - [Visual opportunity]
>
> **Recommended action:** [specific skill to address the biggest opportunity]
