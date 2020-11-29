# PowerShell
https://docs.microsoft.com/ru-ru/windows/terminal/tutorials/powerline-setup

tl;dr:
1. Install modules:
```shell script
Install-Module PSReadLine -Scope CurrentUser

Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

Install-Module PSKubectlCompletion -Scope CurrentUser
Install-Module DockerCompletion -Scope CurrentUser
```
2. Create [Microsoft.PowerShell_profile.ps1](/_files/Microsoft.PowerShell_profile.ps1) file in:
  * `%HOME%/Documents/WindowsPowerShell/` for classic `PowerShell`
  * `%HOME%/Documents/PowerShell/` for `PowerShell Core`
