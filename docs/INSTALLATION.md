# Installing Brand Toolkit

## Prerequisites

- Claude Code installed and working (`claude --version` should return something)
- Git

---

## Install

Clone directly into the Claude Code plugins directory. Claude Code auto-discovers plugins here on every session.

<details open>
<summary><strong>Mac / Linux / Git Bash / WSL</strong></summary>

```bash
git clone https://github.com/jgerton/brand-toolkit.git ~/.claude/plugins/brand-toolkit
```

</details>

<details>
<summary><strong>Windows PowerShell</strong></summary>

```powershell
git clone https://github.com/jgerton/brand-toolkit.git $env:USERPROFILE\.claude\plugins\brand-toolkit
```

</details>

<details>
<summary><strong>Windows Command Prompt</strong></summary>

```cmd
git clone https://github.com/jgerton/brand-toolkit.git %USERPROFILE%\.claude\plugins\brand-toolkit
```

</details>

No config files to edit, no restart required. Open a new Claude Code session in any project and the skills are there.

---

## Verify the Install

Run the verify script for your terminal. It checks that everything landed in the right place.

**Which terminal are you using?**

| Terminal | Command |
|----------|---------|
| Mac / Linux / Git Bash / WSL | `~/.claude/plugins/brand-toolkit/scripts/verify-install.sh` |
| Windows PowerShell | `& "$env:USERPROFILE\.claude\plugins\brand-toolkit\scripts\verify-install.ps1"` |
| Windows Command Prompt | `%USERPROFILE%\.claude\plugins\brand-toolkit\scripts\verify-install.bat` |

You should see all `[OK]` checks. If anything shows `[ISSUE]`, the script tells you exactly what to fix.

---

## Try It Without Installing

If you want to test before committing to a permanent install, clone anywhere and load it for one session:

```bash
git clone https://github.com/jgerton/brand-toolkit.git
claude --plugin-dir ./brand-toolkit
```

Nothing gets written to your system. The plugin loads for this session only.

---

## Already Cloned It Somewhere Else?

Symlink it instead of cloning again:

<details>
<summary><strong>Mac / Linux</strong></summary>

```bash
ln -s /path/to/brand-toolkit ~/.claude/plugins/brand-toolkit
```

</details>

<details>
<summary><strong>Windows PowerShell (run as admin)</strong></summary>

```powershell
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.claude\plugins\brand-toolkit" -Target "C:\path\to\brand-toolkit"
```

</details>

<details>
<summary><strong>Windows Command Prompt (run as admin)</strong></summary>

```cmd
mklink /D %USERPROFILE%\.claude\plugins\brand-toolkit C:\path\to\brand-toolkit
```

</details>

---

## Troubleshooting

<details>
<summary><strong>Plugin not loading after install</strong></summary>

- Check the directory name is exactly `brand-toolkit` (not `brand-toolkit-main` or anything GitHub appended)
- Verify the `skills/` directory is inside it: `ls ~/.claude/plugins/brand-toolkit/skills/`
- Start a new Claude Code session (plugins load at session start)
- Run the verify script to check everything

</details>

<details>
<summary><strong>Skills not showing up</strong></summary>

- Make sure you're running Claude Code (`claude` in terminal), not the Claude web interface at claude.ai
- Plugins only load in Claude Code, not Claude.ai

</details>

<details>
<summary><strong>Permission errors (Mac/Linux)</strong></summary>

```bash
chmod -R 755 ~/.claude/plugins/brand-toolkit
```

</details>

<details>
<summary><strong>Windows path issues</strong></summary>

- Use `$env:USERPROFILE` in PowerShell, `%USERPROFILE%` in Command Prompt
- The final path should look like `C:\Users\yourname\.claude\plugins\brand-toolkit`
- Avoid spaces in the path

</details>

---

## Optional: Companion Skills

Brand Toolkit works on its own, but plays better with a couple of skills from [claude-skills](https://github.com/jgerton/claude-skills):

- `market-researcher`: Problem validation and competitive landscape research. The `start` skill can route you here when your idea needs validation before brand positioning makes sense.
- `ideation-expert`: Stress-tests your concept with brand-brief awareness.

Without these, the toolkit still runs, it just skips the research routing options.

---

## Your First Brand Session

Run `/brand-toolkit:start` in any project directory. The toolkit figures out where you are and what to do next. New project with nothing built yet? It walks you through the seed stage. Existing product with scattered brand assets? It routes to the brand audit. Active brand that needs a refresh? It reads your existing brief and picks up where you left off.

The entry point is always `/brand-toolkit:start`.
