$TemplatePowerShellModule = 'MODULENAME'
$classFileName = 'MODULENAME.Class.psm1'
$classFilePath = Join-Path $PSScriptRoot "../$($classFileName)"
$sourceClassFilePath = $PSScriptRoot 
$destFilePath = Join-Path $PSScriptRoot "../../../$($TemplatePowerShellModule)/Class/$($classFileName)"

# Create class file
Set-Content -Path $classFilePath -Value ''

# Namespace
Get-Content -Path (Join-Path $sourceClassFilePath namespace.ps1) | Add-Content -Path $classFilePath

# Load Private Functions
Join-Path $PSScriptRoot "../../../$($TemplatePowerShellModule)/Private" | Join-Path -ChildPath *.ps1 | Get-ChildItem -Recurse -Force | ? {
    $_.Name -notmatch 'Tests/.ps1$' -and
    $_.Name -notmatch 'Types?/.ps1$'
} | % { Add-Content -Path $classFilePath -Value (Get-Content $_.FullName) }

# Enum
Get-Content -Path (Join-Path $sourceClassFilePath MODULENAME.Enum.ps1 ) | Add-Content -Path $classFilePath

# Classes
Get-Content -Path (Join-Path $sourceClassFilePath BCVersion.Class.ps1 ) | Add-Content -Path $classFilePath
Get-Content -Path (Join-Path $sourceClassFilePath MODULENAME.Class.ps1 ) | Add-Content -Path $classFilePath

Copy-Item -Path $classFilePath -Destination $destFilePath -Force