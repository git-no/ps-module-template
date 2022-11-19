Describe "Class Function Test" {
    BeforeAll {
    }
    Context 'New-MODULENAME' {
        It "by pipline value" {
                (New-MODULENAME).GetType().Name | Should -Be "MODULENAME"
        }
            
    }
}