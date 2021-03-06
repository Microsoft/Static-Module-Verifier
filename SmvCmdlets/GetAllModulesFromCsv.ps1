﻿param([string] $completePathCsvFile, [string] $columnName, [string] $dllFolderPath, [string] $sessionId, [string] $AzCopyPath)

$modulePaths = Import-Csv $completePathCsvFile | % {$_.$columnName}
& $dllFolderPath\preparePowershellWindow.ps1 -folderPath $dllFolderPath
$modulePaths
if(Test-Path ModulesFromCsv-$sessionId){
	Remove-Item ModulesFromCsv-$sessionId -Recurse
}
New-Item ModulesFromCsv-$sessionId -ItemType Directory
cd ModulesFromCsv-$sessionId
$count = 1
foreach($modulePath in $modulePaths){
	$modulePath
	New-Item Module_$count -ItemType Directory
	cd Module_$count
	$modulePath | Out-File ModuleName.txt
    Get-ModuleFolderWithoutSdxRoot -SessionId $sessionId -ModulePath $modulePath -AzCopyPath $AzCopyPath
	cd ..
	$count++
} 
cd ..
