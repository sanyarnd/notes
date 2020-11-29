Import-Module PSReadLine
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Import-Module DockerCompletion
Import-Module posh-git
Import-Module oh-my-posh
Import-Module PSKubectlCompletion

Register-KubectlCompletion
Set-Theme Agnoster
