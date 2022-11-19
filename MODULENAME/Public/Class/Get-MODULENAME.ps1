#import .\MODULENAME\Class\MODULENAME.Class.psm1

function Get-MODULENAME {
    [CmdletBinding()]
    # [OutputType([MODULENAME])]
    [OutputType('MODULENAME')] 
    Param()

    return [MODULENAME]::Instance
}
