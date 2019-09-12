@echo off

taskkill /f /im HelpPane.exe
takeown /f %WinDir%\HelpPane.exe

REM YOU NEED TO CHANGE THE NEXT LINE
REM group name depends on locale
REM for example "Everyone", "Все" etc
icacls %WinDir%\HelpPane.exe /deny Everyone:(X)

pause
