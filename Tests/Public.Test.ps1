Describe "Public Function Test" {
    BeforeAll {
    }
    Context 'Public' {
        It "1 is 1" {
            1 | Should -Be 1
        }            
    }
}