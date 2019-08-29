@echo off

REM kill the process
taskkill /f /im HelpPane.exe

REM take ownership
takeown /f %WinDir%\HelpPane.exe

REM revoke group access, group name depends on locale: "Everyone", "Все" etc
icacls %WinDir%\HelpPane.exe /deny Everyone:(X)

pause
