# Brand Toolkit - Installation Verification (PowerShell)
# Usage: & "$env:USERPROFILE\.claude\plugins\brand-toolkit\scripts\verify-install.ps1"

$ErrorActionPreference = "Stop"

$PASS = "[OK]"
$FAIL = "[ISSUE]"
$errors = 0

# Where this script lives
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$PluginDir = Split-Path -Parent $ScriptDir
$PluginName = Split-Path -Leaf $PluginDir

# Expected skills
$ExpectedSkills = @(
    "brand-ad-copy"
    "brand-audit"
    "brand-competitor-scan"
    "brand-landing-page"
    "brand-messaging"
    "brand-positioning"
    "brand-radar"
    "brand-visual-identity"
    "brand-voice"
    "start"
)

Write-Host ""
Write-Host "Brand Toolkit install check"
Write-Host "==========================="
Write-Host ""

# 1. Check plugin.json
$pluginJson = Join-Path $PluginDir ".claude-plugin\plugin.json"
if (Test-Path $pluginJson) {
    Write-Host "  $PASS plugin.json found"
} else {
    Write-Host "  $FAIL plugin.json missing"
    Write-Host "       Expected at: $pluginJson"
    $errors++
}

# 2. Check skills directory
$skillsDir = Join-Path $PluginDir "skills"
if (Test-Path $skillsDir) {
    Write-Host "  $PASS skills/ directory found"
} else {
    Write-Host "  $FAIL skills/ directory missing"
    Write-Host "       Expected at: $skillsDir"
    $errors++
}

# 3. Count and check individual skills
$found = 0
$missingSkills = @()
foreach ($skill in $ExpectedSkills) {
    $skillPath = Join-Path $PluginDir "skills\$skill\SKILL.md"
    if (Test-Path $skillPath) {
        $found++
    } else {
        $missingSkills += $skill
    }
}

if ($missingSkills.Count -eq 0) {
    Write-Host "  $PASS $found/$found skills detected"
} else {
    Write-Host "  $FAIL $found/$($ExpectedSkills.Count) skills detected"
    foreach ($ms in $missingSkills) {
        Write-Host "       Missing: $ms"
    }
    $errors++
}

# 4. Check if installed in the auto-load directory
$claudePluginsDir = Join-Path $env:USERPROFILE ".claude\plugins\brand-toolkit"
$pluginDirResolved = (Resolve-Path $PluginDir).Path
$inPluginsDir = $false
if (Test-Path $claudePluginsDir) {
    $expectedResolved = (Resolve-Path $claudePluginsDir).Path
    if ($pluginDirResolved -eq $expectedResolved) {
        $inPluginsDir = $true
    }
}

if ($inPluginsDir) {
    Write-Host "  $PASS Installed in ~\.claude\plugins\ (auto-loads every session)"
} else {
    Write-Host "  $FAIL Not in ~\.claude\plugins\"
    Write-Host "       Claude Code won't auto-load this plugin."
    Write-Host "       Fix: move or clone to $claudePluginsDir"
    Write-Host "       Or use: claude --plugin-dir `"$PluginDir`" (loads for one session only)"
    $errors++
}

# 5. Check directory name
if ($PluginName -eq "brand-toolkit") {
    Write-Host "  $PASS Directory name is correct (brand-toolkit)"
} else {
    Write-Host "  $FAIL Directory name is '$PluginName' (expected 'brand-toolkit')"
    Write-Host "       GitHub sometimes appends '-main' or a branch name when downloading."
    Write-Host "       Fix: rename the directory to 'brand-toolkit'"
    $errors++
}

# Summary
Write-Host ""
if ($errors -eq 0) {
    Write-Host "  Ready to use. Open Claude Code and run /brand-toolkit:start"
} else {
    Write-Host "  Found $errors issue(s). Fix them and run this script again."
}
Write-Host ""
