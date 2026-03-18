---
name: brand-sync
description: Sync brand-brief.md between project directory and Obsidian vault. Handles conflict detection and resolution.
---

# Brand Sync

Synchronize brand-brief.md between the current project directory and the Obsidian vault.

## Process

### 1. Locate Files

Find brand-brief.md in both locations:
- **Project:** Current working directory or codebase path from the brief
- **Vault:** `E:\TheVault\The Vault\brands\{project}.md`

Use the `project` field from the YAML frontmatter to determine the vault filename.

### 2. Conflict Detection

If both files exist, compare `last_updated` timestamps:

- **Project is newer:** Offer to push project → vault
- **Vault is newer:** Offer to pull vault → project
- **Same timestamp:** No sync needed
- **Both modified since last sync:** Conflict. Present both versions' key differences and ask user which to keep, or offer to merge.

### 3. Sync Actions

**Push (project → vault):**
1. Read project brand-brief.md
2. Copy to vault path, creating the brands/ directory if needed
3. Update vault_path in the project copy
4. Confirm: "Pushed brand-brief.md to vault at [path]"

**Pull (vault → project):**
1. Read vault brand file
2. Copy to project directory as brand-brief.md
3. Update codebase path in the brief if different
4. Confirm: "Pulled brand-brief.md from vault at [path]"

**Create vault entry (vault doesn't exist yet):**
1. Read project brand-brief.md
2. Create vault file at `E:\TheVault\The Vault\brands\{project}.md`
3. Add Obsidian frontmatter properties (tags, aliases) alongside brand YAML
4. Update vault_path in project copy
5. Confirm: "Created vault entry at [path]"

### 4. Vault Formatting

When creating or updating the vault copy, ensure it has Obsidian-compatible frontmatter:
- Add `tags: [brand, {business_type}]`
- Add `aliases: [{brand_name}]` if brand_name is set
- Preserve all brand-brief YAML fields
- Keep the markdown body intact

### 5. Summary

After sync, display:
```
Brand Sync Complete
  Project: [path]
  Vault:   [path]
  Direction: [push/pull/create]
  Stage: [current stage]
  Last updated: [date]
```
