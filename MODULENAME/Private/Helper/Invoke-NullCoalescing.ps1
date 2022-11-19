# This module is derived from Richard Berg's Invoke-IfScriptBlock.ps1 and Invoke-Ternary.ps1 modules:
# http://tfstoys.codeplex.com/SourceControl/changeset/view/33350#Modules/RichardBerg-Misc
# https://github.com/alx9r/ToolFoundations/blob/master/Functions/invoke.ps1
# https://stackoverflow.com/questions/25682507/powershell-inline-if-iif

Set-Alias ?? Invoke-NullCoalescing

function Invoke-NullCoalescing {
    <#
.SYNOPSIS
If Condition gets coerced to True, emit Primary, otherwise Alternate.

.DESCRIPTION
The only things that should fail the test are:
(1) a boolean whose value is False
(2) an empty collection
(3) a collection whose last value is boolean false
(4) null

Primary and Alternate can be wrapped in scriptblocks if you need delayed execution.

Obviously there is similarity between Invoke-Coalescing and -Ternary.  It's mainly just syntax. Both functions are designed to look like the corresponding operators in C-style languages by using the pipeline to simulate infix notation.  (functions are usually prefix, and you can't define your own operators in Powershell)  Pipeline-based construction also allows them to be chained together in interesting [but different] ways.

.EXAMPLE
1 + 1 -eq 2 | ?? $null "new math"

.EXAMPLE
get-process asdfjkl* | ?: {$null.TotallyIllegal()} {"Ok"}

.EXAMPLE
# a puzzle - don't cheat
$false, $true | ?: $false $true | ?: $false $true | ?: $false $true | ?: $false $true
#>
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline = $True)]
        [object]$Primary,

        [parameter(Position = 0)]
        [object]$Alternate
    )

    end {
        if ($null -ne $Primary)
        { Invoke-IfScriptBlock $Primary }
        else
        { Invoke-IfScriptBlock $Alternate }
    }
}
function Invoke-IfScriptBlock($object) {
    if ($object -is [scriptblock]) {
        & $object
    }
    else {
        $object
    }
}
