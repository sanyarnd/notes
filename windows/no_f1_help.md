##### Disable annoying F1 button behaviour (open Help)

Tweak and run the following .bat file:

no_f1.bat:
```bat
@echo off

REM kill the process just in case
taskkill /f /im HelpPane.exe

REM take ownership
takeown /f %WinDir%\HelpPane.exe

REM group names depend on locale, i.e. "Everyone", "Все" etc
icacls %WinDir%\HelpPane.exe /deny Everyone:(X)

pause
```
**WARNING!** cmd.exe requires specific encoding in case of non-english languages (e.g. `OEM-866` for Russian). Otherwise your group name will not be interpreted correctly.
