#Requires -RunAsAdministrator

Write-Host "Configuring registry fixes..."

Write-Host "Disable F1 Help functionality in Windows itself"
reg.exe import .\disable-f1.reg

Write-Host "Remove This PC folders"
reg.exe import .\remove-this-pc-entries.reg
