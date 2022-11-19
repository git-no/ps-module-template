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