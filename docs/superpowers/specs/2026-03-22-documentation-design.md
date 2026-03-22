# Brand Toolkit Documentation Design

## Goal

Add installation and getting-started documentation to the brand-toolkit GitHub repo. Written in Jon's established brand voice (casual, direct, practitioner-to-practitioner). Separate docs linked from README so the primary README stays focused on value proposition.

## Audience

Primary: Claude Code users who find the plugin on GitHub and want to install and try it. Secondary: YCAH/Skool community members who may be newer to Claude Code plugins.

## Voice Guidelines

From the brand brief (voice dimensions: casual -2, slightly funny -1, slightly irreverent -1, slightly enthusiastic -1):

- **Sounds like**: A smart friend showing you their workshop, a senior dev pair-programming with you
- **Not like**: A press release, a professor, a hype YouTuber, a gatekeeper
- **Use**: build, ship, install, try this, here's what I found, here's what actually works
- **Avoid**: innovative, cutting-edge, leverage, comprehensive, empower, synergy, game-changing
- **Anti-slop**: Every heading and paragraph should fail the swap test (could a generic README use this same text? If yes, rewrite it)

## Deliverables

### 1. docs/INSTALLATION.md (~100-150 lines)

**Sections:**
- Prerequisites (Claude Code, git)
- Quick start: clone + `claude --plugin-dir ./brand-toolkit` (try it now, no commitment)
- Permanent install: copy or symlink to `~/.claude/plugins/brand-toolkit` (keep it around)
- Verify it works: run `start`, confirm skills load
- Troubleshooting: 2-3 common issues (plugin not loading, path issues, permissions)

**Tone example**: "Run this." not "Execute the following command." Show terminal output where helpful.

**Platform note**: The permanent install path `~/.claude/plugins/` is Unix-style. Include a Windows equivalent (`%USERPROFILE%\.claude\plugins\`) since the secondary audience includes less technical users who may be on Windows.

**Verified**: `claude --plugin-dir <path>` is the correct flag (confirmed against Claude Code CLI help). The skill name `start` and manifest file `brand-brief.md` are confirmed in the codebase.

### 2. docs/GETTING-STARTED.md (~200-250 lines)

**Sections:**
- What you just installed: orientation to the plugin structure (skills, commands, the brand-brief.md smart manifest)
- Your first run: invoke `start`, what to expect, how it detects your context and routes you
- Walk-through - building your positioning: step-by-step through `brand-positioning` skill showing the Dunford framework in action, the adaptive interactivity, and the anti-slop checks
- What's in your brand-brief.md now: explain the generated output, confidence scoring, how downstream skills consume it
- What's next: pointer to messaging, voice, visual identity with "each skill builds on the last"

**Tone example**: "Let's build something." not "This comprehensive guide will walk you through."

**Output examples**: The positioning walkthrough should include representative examples of:
- The adaptive questioning (how the skill asks about competitive alternatives)
- An anti-slop check catching generic language (e.g., swap test failing on "innovative solutions")
- The confidence scoring output in brand-brief.md (validated/researched/assumed)

These should be crafted examples based on the actual skill behavior (read the `brand-positioning/SKILL.md` for the interaction patterns), not raw CLI output dumps.

### 3. README.md updates (minimal)

Replace the current two-line Install section:

```markdown
## Get Started

Clone it, point Claude Code at it, run `start`.

- [Installation guide](docs/INSTALLATION.md) - two install methods, takes 30 seconds
- [Getting started](docs/GETTING-STARTED.md) - your first brand positioning in 10 minutes
```

Keep all other README content as-is. The README already does a good job selling the value.

## What's NOT in scope

- API reference or exhaustive skill documentation (the README tables are sufficient)
- CONTRIBUTING.md (premature, no external contributors yet)
- CHANGELOG.md (can add later when there are releases)
- GitHub Pages or wiki (overkill for current size)

## Success Criteria

- Someone who's never seen brand-toolkit can go from `git clone` to a completed positioning draft in under 15 minutes
- The docs sound like Jon wrote them, not like a template
- No banned vocabulary (innovative, cutting-edge, comprehensive, etc.)
- Every section passes the swap test: could this text belong to a random open-source project? If yes, it's too generic
