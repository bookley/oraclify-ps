SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%Oraclify.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'" %1
pause