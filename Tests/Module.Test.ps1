$TemplatePowerShellModule = 'MODULENAME'

$here = "$(Split-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) -Parent)\$TemplatePowerShellModule"

Describe "$TemplatePowerShellModule PowerShell Module Tests" {
    # Context 'Module Setup' {
    #     It "has the root module $TemplatePowerShellModule.psm1" {
    #         "$here\$TemplatePowerShellModule.psm1" | Should -Exist
    #     }
    #     It "has the manifest file $TemplatePowerShellModule.psd1" {
    #         "$here\$TemplatePowerShellModule.psd1" | Should -Exist
    #     }
    #     It "$TemplatePowerShellModule has class" {
    #         "$here\Class\$TemplatePowerShellModule.Class.psm1" | Should -Exist
    #     }
    #     It "$TemplatePowerShellModule has functions" {
    #         Get-ChildItem -Path "$($here)\Public" -Filter *.ps1 -Recurse | Select FullName -ExpandProperty FullName | Should -Exist
    #         Get-ChildItem -Path "$($here)\Private" -Filter *.ps1 -Recurse | Select FullName -ExpandProperty FullName | Should -Exist
    #     }
    #     It "$TemplatePowerShellModule is valid PowerShell Code" {
    #         $psFile = Get-Content -Path "$here\$TemplatePowerShellModule.psm1" -ErrorAction Stop
    #         $errors = $null
    #         $null = [System.Management.Automation.PSParser]::Tokenize($psFile, [ref]$errors)
    #         $errors.count | Should -Be 0
    #     }
    # }
}
