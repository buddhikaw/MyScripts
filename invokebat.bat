::Call ps file
echo "start"
SET PowerShellScriptPath="C:\Users\bnwim\Documents\GitHub\MyScripts\backup_clean.ps1"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%' -BkpParentFolderPath 'D:\test folder' -RetainLastFolderCount '2'"
echo "finish"