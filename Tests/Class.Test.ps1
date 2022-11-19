Describe "Class Function Test" {
    BeforeAll {
    }
    Context 'Get-MODULENAME' {
        It "by pipline value" {
                (Get-MODULENAME).GetType().Name | Should -Be "MODULENAME"
        }
            
    }
}