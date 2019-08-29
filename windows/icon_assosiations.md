Problem:
When assosiating editors (notepad++/notepad) to text files, the icon is changed as well.
Default Windows icon for .txt is much better, so here's the trick:
1. Create the new key at `HKEY_CLASSES_ROOT\Applications\<program>\DefaultIcon`
2. Set default value to `%SystemRoot%\system32\imageres.dll,-102`
3. Run `C:\Windows\system32\ie4uinit.exe -show` to invalidate icons without reboot

Here's `.reg` sample (don't forget provide application name, i.e. `notepad.exe` or`notepad++.exe`):
```reg
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Applications\notepad.exe\DefaultIcon]
@="%SystemRoot%\\system32\\imageres.dll,-102"
```
