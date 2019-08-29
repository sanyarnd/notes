# Windows Tweaks
Collection of ad-hoc solution for annoying `Windows`' behavior.

- [Windows Tweaks](#windows-tweaks)
  - [Disable F1 help](#disable-f1-help)
  - [Switch input methods hotkey](#switch-input-methods-hotkey)
  - [Change text editor icon](#change-text-editor-icon)


## Disable F1 help
Run the [script](/files/disableF1.bat).

_NB: `cmd.exe` requires specific `.bat` encoding for non-english locales (e.g. `OEM-866` for Russian). Save the script with corresponding encoding, otherwise it won't work._


## Switch input methods hotkey
1. Install [AutoHotKey](https://www.autohotkey.com/)
2. Copy the following [file](/files/capslockLayout.ahk) to `Main Menu/Startup`
Verify that Windows settings for switching are `Alt+Shift`.



## Change text editor icon
Use default `Windows` icon of text files for all editor-assosiated extensions.
1. Create the new key in [the registry](/files/textEditorIcon.reg) (you can provide your own application name instead, e.g. `notepad++.exe`)
2. Run to invalidate icons without reboot:
    ```bat
    C:\Windows\system32\ie4uinit.exe -show
    ```
