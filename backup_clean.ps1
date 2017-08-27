<#
   "Winter Is Coming" - House of Stark
   Script by : Buddhika
   Date : 27/08/2017(Sunday , so don't complain instead let’s improve it)
   Description : Helps to housekeep by removing unnecessary devops backups.
   Backupfolder naming convention should be YYYYMMDDHHmm or YYYYMMDD
   
   How to invoke from .bat :
   SET PowerShellScriptPath="D:\test folder\backup_clean.ps1"
   PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%' -BkpParentFolderPath 'D:\test folder' -RetainLastFolderCount '2'"
#>
param (
[string] $BkpParentFolderPath = $null,
[int] $RetainLastFolderCount = 2
)
#Compulsory to retain at least last two folders
if ($RetainLastFolderCount -le 2) { $RetainLastFolderCount = 2 }
write-output  ("Backup Folder path :" + $BkpParentFolderPath)
write-output  ("Remain Folder Count :" + $RetainLastFolderCount)
if(Test-Path $BkpParentFolderPath)
{
	$items = Get-ChildItem -Path $BkpParentFolderPath -Directory | Where-Object {$_.Name -match "\b\d{8,12}\b"}
	$items = $items.name | sort
	for($i=0; $i -lt ($items.count - $RetainLastFolderCount); $i++)
	{
		write-output ("Ready to delete :" + $items[$i])
		Remove-Item -LiteralPath ($BkpParentFolderPath + "\"+$items[$i]) -Force -Recurse
		write-output ("Deleted :" + $items[$i])
	}
}
