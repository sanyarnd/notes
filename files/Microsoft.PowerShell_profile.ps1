oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_lean.omp.json" | Invoke-Expression

Import-Module PSReadLine
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Import-Module DockerCompletion
Import-Module posh-git
