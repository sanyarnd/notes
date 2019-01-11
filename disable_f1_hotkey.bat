@echo off
taskkill /f /im HelpPane.exe
takeown /f %WinDir%\HelpPane.exe
REM в зависимости от локали будет Everyone или Все
icacls %WinDir%\HelpPane.exe /deny Everyone:(X)
