$containerName = 'BC16-CU4-IT-WIN'
$LicenseFile = "licenseFile.flf"
$version = "16.4"
$Country = "it"


$artifactUrl = Get-BCArtifactUrl -country $Country.ToLower() -type onprem -version $version -select Latest

$credential = get-credential -UserName $env:USERNAME -Message "Using Windows Authentication. Please enter your Windows credentials."

New-BcContainer $containerName `
    -artifactUrl $artifactUrl `
	-alwaysPull `
    -accept_eula `
    -auth Windows `
	-Credential $credential `
    -licenseFile $LicenseFile `
    -updateHosts `
    -includeTestToolkit `
    -includeTestLibrariesOnly `
    -doNotExportObjectsToText `
    -assignPremiumPlan `
    -shortcut None `
    -accept_outdated 


Setup-NavContainerTestUsers -containerName $containername -password $credential.Password