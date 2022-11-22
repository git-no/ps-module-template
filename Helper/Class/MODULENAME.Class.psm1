
using namespace System.Collections.Generic

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
# This module is derived from Richard Berg's Invoke-IfScriptBlock.ps1 and Invoke-Ternary.ps1 modules:
# http://tfstoys.codeplex.com/SourceControl/changeset/view/33350#Modules/RichardBerg-Misc
# https://github.com/alx9r/ToolFoundations/blob/master/Functions/invoke.ps1
# https://stackoverflow.com/questions/25682507/powershell-inline-if-iif

Set-Alias ?: Invoke-Ternary

function Invoke-Ternary {
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
1 + 1 -eq 2 | ?: "yay" "new math"

.EXAMPLE
get-process asdfjkl* | ?: {$null.TotallyIllegal()} {"Ok"}

.EXAMPLE
# a puzzle - don't cheat
$false, $true | ?: $false $true | ?: $false $true | ?: $false $true | ?: $false $true
#>
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline = $True)]
        [object]$Condition,

        [parameter(Position = 0)]
        [object]$Primary,

        [parameter(Position = 1)]
        [object]$Alternate
    )

    end {
        if ($Condition)
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
# $SecureKey = 'MODULENAME'

# function Convert-PlainStringToEncryptedString {
#   [OutputType([string])]
#   Param (
#     [String] $String
#   )

#   return (ConvertTo-SecureString -String $String -AsPlainText -Force | ConvertFrom-SecureString)
# }


# function Convert-SecureStringToEncrypted {
#   [OutputType([string])]
#   Param (
#     [securestring] $SecureString
#   )

#   return (ConvertFrom-SecureString -String $String -AsPlainText -Force | ConvertFrom-SecureString)
# }
# $secure | ConvertTo-SecureString -SecureKey 
# convertto-securestring "P@ssW0rD!" -asplaintext -force |convertfrom-securestring

function Convert-SecureStringToPlainString {
  [OutputType([string])]
  Param (
    [SecureString] $SecureString
  )

  $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString)
  $string = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
  return $string
}

function Convert-EncryptedStringToPlainString {
  # [OutputType([string])]
  Param (
    [String] $EncryptedString
  )

  $secureString = ConvertTo-SecureString -String $EncryptedString
  $string = Convert-SecureStringToPlainString -SecureString $secureString
  return $string
}
# enums are a list of acceptable keys/values to use

# Ändern in Extension Type?
enum BCVersionType {
    OnPremise
    Cloud
}

# enum EnumExample1 {
#     Error
#     Warning
#     Information
#     SuccessAudit
#     FailureAudit
# }

# # enums can also have their own static value (key=value pair)
# enum EnumExample2 {
#     Error = 1001
#     Warning = 1002
#     Information = 1003
#     SuccessAudit = 1004
#     FailureAudit = 1005
# }


# # Aus BCRapid Upgrade

# enum AssemblyObjectType {
#     Undefined = 0
#     PreScript = 1
#     PostScript = 2    
#     License = 4
#     Navision = 8
#     BusinessCentral = 16
# }

# enum AssemblyFileType {
#     Undefined
#     APP
#     FLF    
#     FOB
#     PS1
#     SQL
# }

# enum AssemblyAppType {
#     Undefined = 0
#     Application = 1
#     Upgrade = 2
#     SystemSymbols = 4
#     ApplicationSymbols = 8
#     SystemApplication = 16
#     BaseApplication = 32
#     MicrosoftApplication = 64
#     MicrosoftExtension = 128
#     TrdPartyExtension = 256
#     AddIn = 512
# }
# ******
# BCVersion
# ******

class BCVersion {

    # Constructors
  
    BCVersion(
        [String]$versionString
    ) {
        $version = VersionFromString($versionString)
  
        $this.major = $version.Major
        $this.minor = $version.Minor
        $this.build = $version.Build
        $this.revision = $version.Revision
        $this.name = "$($this.major).$($this.minor)"
    }
  
    BCVersion(
        [Int32]$major
    ) {
        $version = [Version]::new("$($major).0")
        $this.major = $version.Major
        $this.minor = $version.Minor
        $this.build = $version.Build
        $this.revision = $version.Revision
        $this.name = "$($this.major).$($this.minor)"
    }
  
    BCVersion(
        [Int32]$major,
        [Int32]$minor
    ) {
        $version = [Version]::new($major, $minor)
        $this.major = $version.Major
        $this.minor = $version.Minor
        $this.build = $version.Build
        $this.revision = $version.Revision
        $this.name = "$($this.major).$($this.minor)"
    }
  
    # Properties
  
    [string]$name
    [Int32]$major
    [Int32]$minor
    [Int32]$build
    [Int32]$revision

    [BCVersionType]$type = [BCVersionType]::OnPremise
    [string]$region = 'w1'
  
    
    # Methods
  
    [Version]Version() {
        $version = [Version]::new($this.name)
        return $version
    }

    [Version]VersionFromString($versionString) {
        $versionString -match "(\d{1,2})\.?(\d{0,2})\.?(\d{0,5})\.?(\d{0,5})"
        $versionMajor = @{$true = "0"; $false = $matches[1] }[[String]::IsNullOrEmpty($matches[1])]
        $versionMinor = @{$true = "0"; $false = $matches[2] }[[String]::IsNullOrEmpty($matches[2])]
        $version = [Version]::new("$($versionMajor).$($versionMinor)")

        if (![String]::IsNullOrEmpty($matches[3])) {
            $version = [Version]::new("$($versionMajor).$($versionMinor).$($matches[3])")
        }
        if (![String]::IsNullOrEmpty($matches[4])) {
            $version = [Version]::new("$($versionMajor).$($versionMinor).$($version.build).$($matches[4])")
        }

        return $version
    }

  
    [bool]IsBC() {
        return ($this.major -ge 14)
    }
  
    [bool]IsBC14() {
        return ($this.major -eq 14)
    }
  
    [bool]IsALOnly() {
        return ($this.major -ge 15)
    }
  
    [bool]IsMSAppExt() {
        $number = [decimal]::new("$($this.major).$($this.minor)")
        return ($number -ge 15.3)
    }
  
    [String]Centum() {  
        [String]$version = $this.major
        return $version.PadRight(3, '0')  # 19 => 190
    }
  
    [String]ToString() {
        $value = "$($this.major).$($this.minor)"
        if ($this.build -ne - 1) {
            $value += ".$($this.build)"
        }
        if ($this.revision -ne - 1) {
            $value += ".$($this.revision)"
        }
        return $value
    }
    
    [String]MajorMinorString() {
        return "$($this.major).$($this.minor)"
    }
  
    [String]Common() {
        return "$($this.major).$($this.minor)"
    }
  
    [String]VersionString() {
        $value = "$($this.major).$($this.minor)"
        $value += @{$true = ".0"; $false = ".$($this.build)" }[$this.build -eq - 1]
        $value += @{$true = ".0"; $false = ".$($this.revision)" }[$this.revision -eq -1]
        return $value    
    }
  
    # Setter / Getter
  
}
  
  
# function Main() {
#     $item = [MODULENAME]::Instance
#     $item -eq $null #false

#     $item.SingletonTarget # Singleton object GUID will return
#     $item.SingletonTarget # Same object

#     $item2 = [MODULENAME]::Instance # same instance
#     $item -eq $item2 # true
# }

# There is no documentation for static field "Thread-safeness" but if it is safe, then this Singleton guaranteed thread-safety.
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes?view=powershell-5.1#static-attribute

# Also PowerShell Class doesn't have readonly or getter only keyword to protect field to be overwrite after instantiate.
# Make sure user MUST NOT set [MODULENAME]::Instance field.

class MODULENAME {

    # Singleton properties
    hidden static [MODULENAME] $_instance = [MODULENAME]::new()
    static [MODULENAME] $Instance = [MODULENAME]::GetInstance()
    hidden [Guid] $SingletonTarget = [Guid]::NewGuid()


    # Properties 
    [BCVersion[]] $versions = @()
    # [MODULENAMEUpdate] $update
    
    # hidden [Bool] $_nativ = $false  # nativ => no Container is used; Achtung kann zwischen Versionen unterschiedlich sein, macht also auf Ebene Projekt keinen Sinn


    # Constructor

    hidden MODULENAME() {
        $this.versions = @()
        # $this.update = [MODULENAMEUpdate]::new()
    }


    # Methods 

    hidden static [MODULENAME] GetInstance() {
        return [MODULENAME]::_instance
    }

    # [Bool] IsNativ () {
    #     return $this._nativ
    # }
}
