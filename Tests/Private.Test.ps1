$TemplatePowerShellModule = 'MODULENAME'

Describe "Private Function Test" {
    BeforeAll {
    }

    Context 'Ternary' {
        It "Tenerary" {
            # 1 + 1 -eq 2 | ?: {"yes"} {"no"} | Should -Be "yes"
            # 1 + 1 -eq 3 | ?: "yes" "no" | Should -Be "no"
            # 1 + 1 -eq 2 | ?: "yay" "new math"
            # get-process asdfjkl* | ?: {$null.TotallyIllegal()} {"Ok"}
        }
    }
}