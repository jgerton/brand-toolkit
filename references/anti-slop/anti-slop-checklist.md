# Anti-Slop Checklist

Every skill in the brand-toolkit runs output through these checks before presenting results to the user. If output fails any check, revise before delivering.

---

## 1. Neumeier's Swap Test

**Question:** Could you swap in a competitor's name and this statement would still work?

**How to apply:** Take every positioning statement, tagline, value proposition, or brand description. Replace the brand name with a competitor's name. If it reads just as well, the output is generic and must be revised.

**Fail example:** "We deliver innovative solutions that help businesses grow."
**Pass example:** "We're the only meal-kit service that ships with pre-portioned spice blends from regional farms."

---

## 2. Neumeier's Hand Test

**Question:** Cover the brand name. Can you tell whose piece this is?

**How to apply:** Take any copy, messaging, or visual description. Hide the brand identity. If a stranger couldn't identify the brand from the remaining content, the output lacks distinctiveness.

**Fail example:** A landing page that could belong to any SaaS company.
**Pass example:** Copy with specific terminology, voice quirks, and references only this brand would use.

---

## 3. Specificity Test

**Question:** Does the output contain banned generics?

**Banned words/phrases:**
- "innovative" / "innovation"
- "cutting-edge"
- "best-in-class"
- "world-class"
- "next-generation"
- "revolutionary"
- "game-changing"
- "seamless"
- "holistic"
- "synergy"
- "leverage" (as marketing verb)
- "empower"
- "transform" (without specifying from-what to-what)
- "solutions" (without specifying the solution)
- "passionate about"

**How to apply:** Scan all output for these terms. Each instance must be replaced with a specific, concrete claim. "Innovative scheduling" becomes "drag-and-drop scheduling that auto-resolves conflicts."

---

## 4. Dunford's Differentiation Test

**Question:** Is the claimed value tied to specific, unique attributes?

**How to apply:** For every value claim, trace it back to a specific capability or attribute that the brand uniquely has. If the value claim floats without an anchor to something concrete and differentiated, it fails.

**Fail example:** "We save you time." (How? Everyone claims this.)
**Pass example:** "Our auto-categorization engine processes receipts in 2 seconds, eliminating manual data entry." (Tied to a specific feature.)

---

## 5. Voice Contrast Test

**Question:** Are there explicit "we are NOT" statements?

**How to apply:** Brand voice output must include what the brand is NOT, not just what it is. Voice without contrast is voice without edges. Every voice definition should include at least 3 "NOT" statements.

**Fail example:** "Our voice is friendly and professional."
**Pass example:** "Our voice is friendly but NOT bubbly. Professional but NOT corporate. Direct but NOT blunt. We sound like a smart friend who happens to be an expert, NOT like a press release or a motivational poster."

---

## 6. Business-Type Test

**Question:** Would this output work equally well for a lawn care company AND a SaaS startup?

**How to apply:** If you could transplant the output to a completely different business type and industry without changing anything, it's too generic. Output must reflect the specific business context, audience, and competitive landscape.

**Fail example:** "We help our customers achieve their goals through superior service."
**Pass example:** "We help DevOps teams eliminate 3am pager alerts by auto-remediating the 12 most common Kubernetes failure modes."

---

## How Skills Use This Checklist

1. **During generation:** Use checks 3 and 6 as guardrails while generating output. Catch generics before they make it into the draft.
2. **Post-generation review:** Run all 6 checks on the complete output before presenting to user.
3. **User-facing transparency:** When revising output that failed a check, tell the user which check it failed and why. Example: "I revised the tagline because it failed the swap test; a competitor could claim the same thing."
4. **Confidence scoring:** Output that passes all 6 checks gets `confidence: validated`. Output that passes 4-5 gets `confidence: reviewed`. Output that passes fewer than 4 should be flagged as needing user input.

---

## Quick Reference Card

| # | Test | One-line check |
|---|------|----------------|
| 1 | Swap Test | Could a competitor claim this? |
| 2 | Hand Test | Cover the name, can you tell whose it is? |
| 3 | Specificity | Any banned generic words? |
| 4 | Differentiation | Is value tied to unique attributes? |
| 5 | Voice Contrast | Are there "NOT" statements? |
| 6 | Business-Type | Would this work for any random business? |
