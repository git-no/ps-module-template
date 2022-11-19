# TemplatePowerShellModule
$Name = 'swissmation'
$TemplatePowerShellModule = 'MODULENAME'
Set-StrictMode -Off

# Line break for readability in AppVeyor console
Write-Host -Object ''

Try {
    # Building class
    & "./$TemplatePowerShellModule/Class/lib/build.ps1"

    # This is where the module manifest lives
    $manifestPath = "./$TemplatePowerShellModule/$TemplatePowerShellModule.psd1"

    # Start by importing the manifest to determine the version, then add 1 to the revision
    $manifest = Test-ModuleManifest -Path $manifestPath
    [System.Version]$version = $manifest.Version
    Write-Output "Old Version: $version"
    [String]$newVersion = New-Object -TypeName System.Version -ArgumentList ($version.Major, $version.Minor, ($version.Build + 1))
    Write-Output "New Version: $newVersion"

    # Update the manifest with the new version value and fix the weird string replace bug
    $functionList = ((Get-ChildItem -Path ./$TemplatePowerShellModule/Public -Recurse -Include *.ps1).BaseName)
    # $aliasList = ((Get-ChildItem -Path ./$TemplatePowerShellModule/Public -Recurse -Include *.ps1).AliasName) # geht nicht weil es dateinamen sind; datei müsste erst geöffnet und gepasst erden
    # ((Get-ChildItem -Path .\$TemplatePowerShellModule\Public -Recurse -Include *.ps1).fullpath) | % {import-alias "$($_).ps1"}
    $splat = @{
        'Path'              = $manifestPath
        'ModuleVersion'     = $newVersion
        'FunctionsToExport' = $functionList
        # 'AliasesToExport'   = $aliasList
        'Copyright'         = "(c) 2022-$( (Get-Date).Year ) $Name. All rights reserved."
    }
    Update-ModuleManifest @splat
        (Get-Content -Path $manifestPath) -replace "PSGet_$TemplatePowerShellModule", "$TemplatePowerShellModule" | Set-Content -Path $manifestPath
        (Get-Content -Path $manifestPath) -replace 'NewManifest', $TemplatePowerShellModule | Set-Content -Path $manifestPath
        (Get-Content -Path $manifestPath) -replace 'FunctionsToExport = ', 'FunctionsToExport = @(' | Set-Content -Path $manifestPath -Force
    # (Get-Content -Path $manifestPath) -replace 'AliasesToExport = ', 'AliasesToExport = @(' | Set-Content -Path $manifestPath -Force
        (Get-Content -Path $manifestPath) -replace "$($functionList[-1])'", "$($functionList[-1])')" | Set-Content -Path $manifestPath -Force
}
catch {
    throw $_
}
