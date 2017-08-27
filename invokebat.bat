::Call ps file
SET PowerShellScriptPath="D:\test folder\backup_clean.ps1"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%' -BkpParentFolderPath 'D:\test folder' -RetainLastFolderCount '2'"