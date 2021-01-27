$ContainerInfos = Get-NAVContainerServerConfiguration BC17-IT

$ServerName = $ContainerInfos.ContainerName
$ServerInstance = $ContainerInfos.ServerInstance
if($ContainerInfos.ClientServicesCredentialType -eq "NavUserPassword"){
    $AuthType = "UserPassword"
} elseif($ContainerInfos.ClientServicesCredentialType -eq "Windows"){
    $AuthType = "Windows"
}


$launch = @"
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Your own server",
            "request": "launch",
            "type": "al",
            "environmentType": "OnPrem",
            "server": "http://$ServerName/",
            "serverInstance": "$ServerInstance",
            "authentication": "$AuthType",
            "startupObjectId": 22,
            "startupObjectType": "Page",
            "breakOnError": true,
            "launchBrowser": true,
            "enableLongRunningSqlStatements": true,
            "enableSqlInformationDebugger": true,
            "tenant": "default"
        }
    ]
}
"@

Set-Clipboard $launch