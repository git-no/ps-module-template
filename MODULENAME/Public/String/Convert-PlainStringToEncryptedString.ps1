<#
.SYNOPSIS
    New FunctionName2
.DESCRIPTION
    FunctionName2 Description
.EXAMPLE New FunctionName2
    PS :> New-FunctionName2 -Parameter1 'SomePackageName' -Parameter2 'C:\some\path_to_folder'
.PARAMETER Parameter1
    Parameter1 Description
.PARAMETER Parameter2
    Parameter2 Descripton
.NOTES
    Name: New-FunctionName2
    Author: First Last
    DateCreated: DATE
.FUNCTIONALITY
    FunctionName2 Functionality
#>
function Convert-PlainStringToEncryptedString {
    [OutputType([string])]
    Param (
      [String] $String
    )
  
    return (ConvertTo-SecureString -String $String -AsPlainText -Force | ConvertFrom-SecureString)
  }