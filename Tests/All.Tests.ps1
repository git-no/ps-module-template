# https://pester.dev/docs/assertions/assertions#beoftype

Import-Module (Join-Path $PSScriptRoot "../MODULENAME/MODULENAME.psd1") -force

Invoke-Pester -Path (Get-Item ".\Tests\*.Test.ps1") -CI
# -Exclude "TAll.Test.ps1",TemplatePowerShellModule.Tests_ps1)