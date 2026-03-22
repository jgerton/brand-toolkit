# Brand Toolkit Documentation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add INSTALLATION.md and GETTING-STARTED.md to the brand-toolkit repo, written in Jon's brand voice, and update the README with links.

**Architecture:** Three files: `docs/INSTALLATION.md` (install methods + verify + troubleshoot), `docs/GETTING-STARTED.md` (first run + positioning walkthrough), and minimal `README.md` edits to link to both. All content written in the established brand voice from `E:/Projects/wp-designer/brand-brief.md` (casual -2, slightly funny -1, slightly irreverent -1, slightly enthusiastic -1).

**Tech Stack:** Markdown only. No build step.

**Spec:** `docs/superpowers/specs/2026-03-22-documentation-design.md`

---

## Voice Reference (for all tasks)

Before writing any content, read the voice section of the brand brief at `E:/Projects/wp-designer/brand-brief.md` (lines 88-131). Key rules:

- **Sounds like**: showing someone your workshop, pair-programming, texting a friend about something cool
- **Not like**: press release, professor, hype YouTuber, gatekeeper, salesperson
- **Use**: build, ship, install, try this, here's what actually works, rough edges
- **Avoid**: innovative, cutting-edge, leverage, comprehensive, empower, synergy, game-changing, revolutionary
- **Anti-slop**: swap test every heading and paragraph. If a generic open-source project could use the same text, rewrite it.

---

### Task 1: Write INSTALLATION.md

**Files:**
- Create: `docs/INSTALLATION.md`

**Reference files to read first:**
- `E:/Projects/wp-designer/brand-brief.md` (lines 88-131 for voice)
- `README.md` (current install section to replace/expand)
- `skills/start/SKILL.md` (to describe verification step accurately)

- [ ] **Step 1: Write the installation doc**

Create `docs/INSTALLATION.md` with these sections:

**Header:** Brief intro. "Two ways to install, both take 30 seconds."

**Prerequisites:**
- Claude Code installed and working
- Git

**Quick Start (try it now):**
```bash
git clone https://github.com/jgerton/brand-toolkit.git
claude --plugin-dir ./brand-toolkit
```
Explain: this loads the plugin for one session only. Good for kicking the tires.

**Permanent Install (keep it around):**

macOS/Linux:
```bash
git clone https://github.com/jgerton/brand-toolkit.git ~/.claude/plugins/brand-toolkit
```

Windows:
```bash
git clone https://github.com/jgerton/brand-toolkit.git %USERPROFILE%\.claude\plugins\brand-toolkit
```

Explain: Claude Code auto-loads plugins from `~/.claude/plugins/` on every session.

**Verify It Works:**
- Start Claude Code in any project directory
- The `start` skill and all brand-toolkit skills should be available
- Try invoking `start` to confirm

**Troubleshooting:**
- Plugin not loading: check the directory name matches `brand-toolkit`, verify it contains `skills/` directory
- Permission errors: check file permissions on the cloned directory
- Skills not showing: make sure you're running Claude Code (not base Claude), restart the session

**Tone check:** Read through the whole doc. Does it sound like a friend showing you how to set something up? Or does it sound like a manual? Fix anything that sounds like a manual.

- [ ] **Step 2: Review against anti-slop checklist**

Read `references/anti-slop/anti-slop-checklist.md` in the brand-toolkit repo. Run every heading and paragraph through the swap test. Fix any failures.

- [ ] **Step 3: Commit**

```bash
cd E:/Projects/brand-toolkit
git add docs/INSTALLATION.md
git commit -m "docs: add installation guide"
```

---

### Task 2: Write GETTING-STARTED.md

**Files:**
- Create: `docs/GETTING-STARTED.md`

**Reference files to read first:**
- `E:/Projects/wp-designer/brand-brief.md` (lines 88-131 for voice)
- `skills/start/SKILL.md` (for the `start` flow description)
- `skills/brand-positioning/SKILL.md` (for the positioning walkthrough)
- `references/frameworks/dunford-positioning.md` (for framework detail)
- `references/anti-slop/anti-slop-checklist.md` (for anti-slop example)
- `references/schemas/brand-brief-schema.md` (for brand-brief.md structure explanation)

- [ ] **Step 1: Write the getting-started doc**

Create `docs/GETTING-STARTED.md` with these sections:

**Header:** "Let's build something. Install done? Here's what happens next."

**Section 1 - What you just installed:**
- 10 skills that share state through a single `brand-brief.md` file
- The skills follow a natural order: positioning → messaging → voice → visual identity
- Each skill uses proven expert frameworks (Dunford, Miller, NN/g, Chris Do), not generic AI prompting
- One command (`brand-sync`) to sync your brand brief between projects
- Brief mention of the anti-slop system: "Every skill checks its own output against real quality criteria. If it could belong to your competitor, it gets flagged and rewritten."

**Section 2 - Your first run:**
- Run `start` in any project directory
- It looks for an existing `brand-brief.md`. If none found, it creates one.
- Three paths based on your situation:
  - New idea, no brand assets → routes to positioning
  - Existing business, scattered assets → routes to brand-audit
  - Established brand, needs refresh → detects your brief and recommends next actions
- Example of what `start` outputs (read the full Step 2 section of `start/SKILL.md` for the complete status summary format before crafting the example)

**Section 3 - Walk-through: building your positioning:**

Step through what happens when `brand-positioning` runs. Include crafted examples of:

1. **Adaptive mode selection:** The skill assesses what you know. Show the three modes:
   - Zero knowledge: "I'm going research-assisted because you're early stage."
   - Some knowledge: "You have some positioning pieces already. I'll walk through Dunford's 5 components and fill the gaps."
   - Rich knowledge: "You've got a solid foundation. I'll validate your positioning against Dunford's framework."

2. **The five components:** Brief description of each (competitive alternatives, unique attributes, value, best-fit customers, market category). Keep it practical: "It asks what your customers would do if you didn't exist. Not hypothetically. Actually."

3. **Anti-slop in action:** Show a crafted example of the swap test catching generic language:
   > The skill checks: "Could a competitor claim this?" If your value proposition is "we provide innovative solutions that empower teams," that's a swap test failure. Every competitor on earth claims that. The skill flags it and helps you find what's actually specific to you.

4. **Onlyness statement:** Explain the Neumeier test briefly. Show the format: "Our [offering] is the only [category] that [benefit]."

**Section 4 - What's in your brand-brief.md now:**
- After positioning, your `brand-brief.md` has structured YAML data
- Each component has a confidence score: validated (backed by real data), researched (desk research), or assumed (educated guess, needs validation)
- Downstream skills (messaging, voice, visual) read this file. They warn when prerequisites are incomplete but never block you.
- "The confidence scoring is the honesty layer. It tells you what's solid and what's still a guess."

**Section 5 - What's next:**
- Messaging (Miller StoryBrand): your brand story, tagline, and trueline
- Voice (NN/g + Aaker + Jung): how your brand talks, with on-brand and off-brand examples
- Visual Identity (Chris Do Stylescapes): 3 contrasting visual directions with rationale
- "Each skill builds on the last. Your positioning informs your messaging. Your messaging shapes your voice. Your voice guides your visuals. Skip one and the downstream skills will flag it."

**Tone check:** Same as Task 1. Read the whole doc. Smart friend showing you their workshop, not a technical manual.

- [ ] **Step 2: Review against anti-slop checklist**

Same as Task 1. Run every heading and paragraph through the swap test.

- [ ] **Step 3: Commit**

```bash
cd E:/Projects/brand-toolkit
git add docs/GETTING-STARTED.md
git commit -m "docs: add getting started guide with positioning walkthrough"
```

---

### Task 3: Update README.md

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Update the Install section**

Replace the current Install section (lines ~39-43 in current README):

```markdown
## Install

```bash
git clone https://github.com/jgerton/brand-toolkit
claude --plugin-dir ./brand-toolkit
```
```

With:

```markdown
## Get Started

Clone it, point Claude Code at it, run `start`.

- [Installation guide](docs/INSTALLATION.md) - two install methods, takes 30 seconds
- [Getting started](docs/GETTING-STARTED.md) - your first brand positioning in 10 minutes
```

Note: The code block is intentionally removed from the README. The INSTALLATION.md doc covers the commands with proper context for both quick start and permanent install paths.

Keep the rest of the README unchanged.

- [ ] **Step 2: Commit**

```bash
cd E:/Projects/brand-toolkit
git add README.md
git commit -m "docs: link to installation and getting started guides from README"
```
