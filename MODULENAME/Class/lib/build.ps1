$classFileName = 'MODULENAME.Class.psm1'
$sourceClassFilePath = $PSScriptRoot 
$destFilePath = Join-Path $PSScriptRoot "../$($classFileName)"

# Create class file
Set-Content -Path $destFilePath -Value ''

# Namespace
Get-Content -Path (Join-Path $sourceClassFilePath namespace.ps1) | Add-Content -Path $destFilePath

# Load Private Functions
Join-Path $PSScriptRoot ../../Private | Join-Path -ChildPath *.ps1 | Get-ChildItem -Recurse -Force | ? {
    $_.Name -notmatch 'Tests/.ps1$' -and
    $_.Name -notmatch 'Types?/.ps1$'
} | % { Add-Content -Path $destFilePath -Value (Get-Content $_.FullName) }

# Enum
Get-Content -Path (Join-Path $sourceClassFilePath MODULENAME.Enum.ps1 ) | Add-Content -Path $destFilePath

# Classes
Get-Content -Path (Join-Path $sourceClassFilePath BCVersion.Class.ps1 ) | Add-Content -Path $destFilePath
Get-Content -Path (Join-Path $sourceClassFilePath MODULENAME.Class.ps1 ) | Add-Content -Path $destFilePath
