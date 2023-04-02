Import-Module PSReadLine
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Import-Module DockerCompletion
Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Agnoster
