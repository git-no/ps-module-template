# https://pester.dev/docs/assertions/assertions#beoftype

Invoke-Pester -Path (Get-Item ".\Tests\*.Test.ps1") -CI
# -Exclude "TAll.Test.ps1",TemplatePowerShellModule.Tests_ps1)