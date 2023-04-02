# PowerShell

<https://docs.microsoft.com/ru-ru/windows/terminal/tutorials/powerline-setup>

## Install modules

```shell script
Install-Module PSReadLine -Scope CurrentUser

Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

Install-Module DockerCompletion -Scope CurrentUser
```

## Create [Microsoft.PowerShell_profile.ps1](/files/Microsoft.PowerShell_profile.ps1) file

* `%HOME%/Documents/WindowsPowerShell/` for classic `PowerShell`
* `%HOME%/Documents/PowerShell/` for `PowerShell Core`
