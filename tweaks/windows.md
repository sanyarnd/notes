# Windows Tweaks
Collection of ad-hoc solution for annoying `Windows`' behavior.

- [Windows Tweaks](#windows-tweaks)
  - [Disable F1 help](#disable-f1-help)
  - [Switch input methods hotkey](#switch-input-methods-hotkey)
  - [Change text editor icon](#change-text-editor-icon)
  - [Disable Windows 10 automatic updates](#disable-windows-10-automatic-updates)
  - [WinSXS cleanup](#winsxs-cleanup)

## Disable F1 help
Before run the [script](/_files/disableF1.bat), please read the following:
* You need to modify the specific part of the script (see the script itself)
* `cmd.exe` requires specific `.bat` encoding for non-english locales (e.g. `OEM-866` for Russian). Save the script with corresponding encoding, otherwise it won't work.


## Switch input methods hotkey
1. Install [AutoHotKey](https://www.autohotkey.com/)
2. Copy the following [file](/_files/capslockLayout.ahk) to `Main Menu/Startup`
Verify that Windows settings for switching are `Alt+Shift`.


## Change text editor icon
Use default `Windows` icon of text files for all editor-assosiated extensions.
1. Create the new key in [the registry](/_files/textEditorIcon.reg) (you can provide your own application name instead, e.g. `notepad++.exe`)
2. Run to invalidate icons without reboot:
    ```bat
    C:\Windows\system32\ie4uinit.exe -show
    ```


## Disable Windows 10 automatic updates
1. Navigate to `Start` and run `gpedit.msc`
2. Navigate to `Computer Configuration` -> `Administrative Templates` -> `Windows Components` -> `Windows Update`
3. Select `Configure Automatic Updates`
4. Click on `Enable` and set value to `2` in the dropdown box below

## WinSXS cleanup
After a year or two, `Windows/WinSXS` directory tends to grow too much. Use [official MS guide](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/clean-up-the-winsxs-folder) to remove no longer necessary files and compress data (it can reclaim up to 10-20GB).
