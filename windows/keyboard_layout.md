##### Use <X> button as keyboard layout switch

1. You'll need [AutoHotKey](https://www.autohotkey.com/)
2. Copy the following file to `Main Menu/Startup`:

`caps_layout.ahk`:
```ahk
SetCapsLockState, AlwaysOff
+CapsLock::CapsLock

CapsLock::Send, {Alt down}{Shift down}{Shift up}{Alt up}{Alt up}
return
```

Make sure that Windows settings for layout change are `Alt+Shift`.
