# Installing Brand Toolkit

Two ways to install, both take 30 seconds. One is for kicking the tires, one is for keeping it around.

---

## Prerequisites

- Claude Code installed and working (`claude --version` should return something)
- Git

That's it.

---

## Try It on One Project

Clone the repo next to your project and point Claude Code at it for one session:

```bash
git clone https://github.com/jgerton/brand-toolkit.git
claude --plugin-dir ./brand-toolkit
```

Claude Code loads the plugin for this session only. Good for testing it out before committing to a permanent install. Nothing gets written to your system.

---

## Install It for Every Session

Claude Code auto-loads plugins from `~/.claude/plugins/` on every session. Clone it there and you're done.

**macOS / Linux:**
```bash
git clone https://github.com/jgerton/brand-toolkit.git ~/.claude/plugins/brand-toolkit
```

**Windows:**
```bash
git clone https://github.com/jgerton/brand-toolkit.git %USERPROFILE%\.claude\plugins\brand-toolkit
```

No config files to edit, no restart required. Open a new Claude Code session in any project and the skills are there.

**Already cloned it somewhere else?** Symlink it instead of cloning again:

```bash
# macOS / Linux
ln -s /path/to/brand-toolkit ~/.claude/plugins/brand-toolkit

# Windows (run as admin)
mklink /D %USERPROFILE%\.claude\plugins\brand-toolkit C:\path\to\brand-toolkit
```

---

## Check That Brand Toolkit Loaded

Start Claude Code in any project directory:

```bash
claude
```

Run the `/brand-toolkit:start` skill. It'll check your current directory for an existing brand brief, assess where you are in your brand journey, and route you to the right next step. If it loads and asks you about your project, you're good.

If you want to test without a real project, just invoke `/brand-toolkit:start` in any directory. It'll tell you what it found (probably nothing) and offer paths forward from there.

---

## Something Not Working?

**Plugin not loading after permanent install:**
- Check the directory name is exactly `brand-toolkit` (not `brand-toolkit-main` or anything GitHub appended)
- Verify the `skills/` directory is inside it: `ls ~/.claude/plugins/brand-toolkit/skills/`
- Restart the Claude Code session

**Skills not showing up:**
- Make sure you're running Claude Code (`claude`), not the base Claude web interface
- Plugins only load in Claude Code, not Claude.ai

**Permission errors on macOS/Linux:**
```bash
chmod -R 755 ~/.claude/plugins/brand-toolkit
```

**Windows path issues:**
- Use `%USERPROFILE%` in CMD, `$env:USERPROFILE` in PowerShell
- The final path should look like `C:\Users\yourname\.claude\plugins\brand-toolkit`

---

## Optional: Skills from claude-skills

Brand Toolkit works on its own, but plays better with a couple of skills from [claude-skills](https://github.com/jgerton/claude-skills):

- `market-researcher`: Problem validation and competitive landscape research. The `start` skill can route you here when your idea needs validation before brand positioning makes sense.
- `ideation-expert`: Stress-tests your concept with brand-brief awareness.

Without these, the toolkit still runs, it just skips the research routing options. If `/brand-toolkit:start` can't find them, it'll say so and offer to proceed without.

---

## Your First Brand Session

Once it's installed, run `/brand-toolkit:start` in a project directory. From there, the toolkit figures out where you are and what to do next. New project with nothing built yet? It'll talk you through the seed stage. Existing product with scattered brand assets? It routes to the brand audit. Active brand that needs a refresh? It reads your existing brief and picks up where you left off.

The entry point is always `/brand-toolkit:start`. Everything else follows from there.
