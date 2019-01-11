@echo off

REM kill the process just in case
taskkill /f /im HelpPane.exe

REM take ownership
takeown /f %WinDir%\HelpPane.exe

REM group names depend on locale, i.e. "Everyone", "Все" etc
icacls %WinDir%\HelpPane.exe /deny Everyone:(X)

pause
echo "Press any key to exit..."
