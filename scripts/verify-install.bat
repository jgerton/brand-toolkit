@echo off
REM Brand Toolkit - Installation Verification (cmd.exe)
REM Usage: %USERPROFILE%\.claude\plugins\brand-toolkit\scripts\verify-install.bat

setlocal enabledelayedexpansion

set "PASS=[OK]"
set "FAIL=[ISSUE]"
set errors=0

REM Where this script lives
set "SCRIPT_DIR=%~dp0"
REM Remove trailing backslash
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
REM Go up one level to plugin dir
for %%i in ("%SCRIPT_DIR%\..") do set "PLUGIN_DIR=%%~fi"
for %%i in ("%PLUGIN_DIR%") do set "PLUGIN_NAME=%%~ni"

REM Expected skill count
set EXPECTED_COUNT=10

echo.
echo Brand Toolkit install check
echo ===========================
echo.

REM 1. Check plugin.json
if exist "%PLUGIN_DIR%\.claude-plugin\plugin.json" (
    echo   %PASS% plugin.json found
) else (
    echo   %FAIL% plugin.json missing
    echo        Expected at: %PLUGIN_DIR%\.claude-plugin\plugin.json
    set /a errors+=1
)

REM 2. Check skills directory
if exist "%PLUGIN_DIR%\skills\" (
    echo   %PASS% skills/ directory found
) else (
    echo   %FAIL% skills/ directory missing
    echo        Expected at: %PLUGIN_DIR%\skills\
    set /a errors+=1
)

REM 3. Count skills
set found=0
set "MISSING="
for %%s in (brand-ad-copy brand-audit brand-competitor-scan brand-landing-page brand-messaging brand-positioning brand-radar brand-visual-identity brand-voice start) do (
    if exist "%PLUGIN_DIR%\skills\%%s\SKILL.md" (
        set /a found+=1
    ) else (
        set "MISSING=!MISSING! %%s"
    )
)

if !found!==%EXPECTED_COUNT% (
    echo   %PASS% !found!/%EXPECTED_COUNT% skills detected
) else (
    echo   %FAIL% !found!/%EXPECTED_COUNT% skills detected
    for %%m in (!MISSING!) do echo        Missing: %%m
    set /a errors+=1
)

REM 4. Check if installed in auto-load directory
set "CLAUDE_PLUGINS_DIR=%USERPROFILE%\.claude\plugins\brand-toolkit"
if "%PLUGIN_DIR%"=="%CLAUDE_PLUGINS_DIR%" (
    echo   %PASS% Installed in ~\.claude\plugins\ (auto-loads every session^)
) else (
    echo   %FAIL% Not in ~\.claude\plugins\
    echo        Claude Code won't auto-load this plugin.
    echo        Fix: move or clone to %CLAUDE_PLUGINS_DIR%
    echo        Or use: claude --plugin-dir "%PLUGIN_DIR%" (loads for one session only^)
    set /a errors+=1
)

REM 5. Check directory name
if "%PLUGIN_NAME%"=="brand-toolkit" (
    echo   %PASS% Directory name is correct (brand-toolkit^)
) else (
    echo   %FAIL% Directory name is '%PLUGIN_NAME%' (expected 'brand-toolkit'^)
    echo        GitHub sometimes appends '-main' or a branch name when downloading.
    echo        Fix: rename the directory to 'brand-toolkit'
    set /a errors+=1
)

REM Summary
echo.
if %errors%==0 (
    echo   Ready to use. Open Claude Code and run /brand-toolkit:start
) else (
    echo   Found %errors% issue(s^). Fix them and run this script again.
)
echo.

endlocal
