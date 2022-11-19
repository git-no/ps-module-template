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