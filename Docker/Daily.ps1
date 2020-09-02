$sasToken = "My SaaS Token"
$LicenseFile = "Path To License.flf"

$credential = New-Object pscredential 'admin', (ConvertTo-SecureString -String 'Password123!' -AsPlainText -Force)

$artifactUrl = Get-BCArtifactUrl -country w1 -storageAccount bcinsider -sasToken $sasToken

New-BcContainer Daily-W1 `
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
    -dns 8.8.8.8 