$containerName = 'Conatiner Name'
$LicenseFile = "License.flf"
$version = "14.10"
$Country = "it"
$DBServer = "172.26.235.136"
$DBInstance = "SQLEXPRESS"
$DBName = "Cronus"
$DBcredential = New-Object pscredential 'sa', (ConvertTo-SecureString -String 'Password123!' -AsPlainText -Force)

$credential = New-Object pscredential 'admin', (ConvertTo-SecureString -String 'Password123!' -AsPlainText -Force)

$artifactUrl = Get-BCArtifactUrl -version $version -country $Country -select Latest -type onprem

New-BcContainer $containerName `
    -artifactUrl $artifactUrl `
	-alwaysPull `
    -accept_eula `
    -auth UserPassword `
	-Credential $credential `
    -licenseFile $LicenseFile `
    -updateHosts `
    -shortcut None `
    -accept_outdated `
    -databaseCredential $DBcredential `
    -databaseServer $DBServer `
    -databaseInstance $DBInstance `
    -databaseName $DBName

