<# 
 .Synopsis
  Get the path of the AL Language Extension from an artifactUrl
 .Description
  Downloads artifacts and return the path of the .vsix file within the artifacts
 .Example
  New-BcContainer ... -vsixFile (Get-AlLanguageExtensionFromArtifacts -artifactUrl $artifactUrl) ...
#>
function Get-AlLanguageExtensionFromArtifacts {
    Param(
        [string] $artifactUrl
    )

    $paths = Download-Artifacts $artifactUrl -includePlatform
    $vsixFile = Get-Item -Path (Join-Path $paths[1] "ModernDev\program files\Microsoft Dynamics NAV\*\AL Development Environment\*.vsix")
    if ($vsixFile) {
        $vsixFile.FullName
    }
    else {
        throw "Unable to locate AL Language Extension from artifacts $($artifactUrl.Split('?')[0])"
    }
}
# For latest AL Language
#$sasToken = ""
#$artifactUrl = Get-BCArtifactUrl -country w1 -storageAccount bcinsider -sasToken $sasToken

$artifactUrl = Get-BCArtifactUrl -version 16.2 -country w1 -select Latest -type onprem
Get-AlLanguageExtensionFromArtifacts $artifactUrl