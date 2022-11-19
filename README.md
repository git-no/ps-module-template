# Powershell Module and CI Template

## todo

- test testen
- ein testbefehl
- lizenz aktualisieren, keine kommerzielle nutzung
- Continous Integration
  - PR, build, test, deploy (github actions, )
  - wie automatische Dokumentaiton ahnad commits einbauen?
- develp via github desktop
- dokumentation der Befehle, public automatisch via help, private dokumentieren, dass nicht vergessen gehen.
- Templae Benutzung dokumentieren
- richtiges modul vorbereiten

## Automated Workflows (by Github Actions)

- Workflows by automation
  - Pull Request review -> Merge code to main branch, test, build, versioning
  - Module build on push
  - Module test on push
  - Deploy module to Azure Artifacts Feed on release
- modul für DB Upgrades -> nutzen von VSC module?
- modul? für schnelleres, zielsicheres, test driving programmieren (snippets, fertige module/dateien) -> eher als VSC module?

## Includes

- Powershell Module Template
  - Versioning
- Source code versioning (git)
- Module build process (classes, files module versioning)
- Automated tests
- CI (Github => build, test, deploy)
- Module publishing (Azure Artifact Feed)

- build, versionierung
- Github CI
- Optional publishing a document web site

## Start

- Download or clone via Github
- Init git if downloaded and push to new Github repository
- Replace MODULENAME in all files and filenames
  - Set guid and description and more .psd1 file
- Test & Build locally
- Push to github

## Build

After adding new files build the class and psm by calling

```ps
.\helper\build
```

## Test

Test of the commands

```ps
.\Tests\All.Test.ps1
```

---

## References

https://github.com/PoshCode/ModuleBuilder

### Powershell

https://github.com/zloeber/NLogModule/blob/c352e14044a8fe71f4925f2b39b3af4cfe4de458/src/public/Write-Output.ps1
https://github.com/jasoth/MSIdentityTools/blob/94b2cc295a746263accac154924ed5e94fa5907b/src/ConvertTo-PsParameterString.ps1
https://github.com/DoggLow/DoggLow-/blob/b7295deaf506d55c590491132dc6cb16e3d99355/test/powershell/Modules/Microsoft.PowerShell.Utility/ConvertFrom-Json.Tests.ps1
https://github.com/jasoth/MSIdentityTools/blob/94b2cc295a746263accac154924ed5e94fa5907b/src/ConvertTo-PsString.ps1
https://communary.net/tag/powershell/
https://stackoverflow.com/questions/27764394/get-valuefromremainingarguments-as-an-hashtable
https://learn-powershell.net/2013/05/07/tips-on-implementing-pipeline-support/
https://github.com/jasoth/MSIdentityTools/tree/94b2cc295a746263accac154924ed5e94fa5907b/src
