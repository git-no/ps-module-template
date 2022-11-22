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
