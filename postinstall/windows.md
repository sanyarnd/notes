# Windows Tweaks

Collection of ad-hoc solution for annoying `Windows`' behavior.

## Disable F1 help

- You need to modify the specific part of the script (see the script [itself](/files/disableF1.bat))
- `cmd.exe` requires specific `.bat` encoding for non-english locales (e.g. `OEM-866` for Russian). Save the script with corresponding encoding, otherwise it won't work.

## Switch input methods hotkey

1. Install [AutoHotKey](https://www.autohotkey.com/)
2. Copy the following [file](/files/capslockLayout.ahk) to `Main Menu/Startup`
Verify that Windows settings for switching are `Alt+Shift`.

## Disable Windows 10 automatic updates

1. Navigate to `Start` and run `gpedit.msc`
2. Navigate to `Computer Configuration` -> `Administrative Templates` -> `Windows Components` -> `Windows Update`
3. Select `Configure Automatic Updates`
4. Click on `Enable` and set value to `2` in the dropdown box below
