$containerName = 'NP-2018'
$LicenseFile = "Path To License.flf"
$version = "11.15"
$Country = "it"
$BackFilePath = Path To Database.bak"


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
    -includeTestToolkit `
    -includeTestLibrariesOnly `
    -shortcut None `
    -accept_outdated `
    -dns 8.8.8.8 `
    -bakFile $BackFilePath `
    -includeCSide
