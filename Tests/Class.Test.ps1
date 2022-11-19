Describe "Class Function Test" {
    BeforeAll {
    }

    Describe 'Get-MODULENAME' {
        Context 'values' {
            It " returns Name" {
                $Name = (Get-MODULENAME).GetType().Name 
                $Name | Should -Be "MODULENAME"
            }
        }
    }
}