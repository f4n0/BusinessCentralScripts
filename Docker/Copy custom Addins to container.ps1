$containerName = 'NP-BC14'
$AddinLocation = ''#path to addin location

$RunMy = ((Get-BcContainerSharedFolders -containerName $containerName).GetEnumerator() | Where-Object { $_.Value -eq "c:\run\my" }).Key

New-Item -ItemType Directory -Path $RunMy -Name "customAddin" -ErrorAction Ignore


Copy-Item -Recurse "$AddinLocation\*" "$RunMy\customAddin"

$ContainerId = Get-NavContainerId -containerName $containerName
Write-Host $ContainerId
$Session = New-PSSession -ContainerId $ContainerId -RunAsAdministrator

try {

    Invoke-Command -Session $Session -ScriptBlock {
         $serviceTierFolder = (Get-Item "C:\Program Files\Microsoft Dynamics NAV\*\Service").FullName
        Copy-Item -Recurse "C:\Run\my\customAddin" (Join-Path $serviceTierFolder "Add-ins") 		
		
    }
}
finally {
    if ($null -ne $Session) {
        Remove-PSSession $Session
    }
}
