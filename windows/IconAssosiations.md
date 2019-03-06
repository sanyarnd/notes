Problem:
When assosiating editors (notepad++/notepad) to text files, the icon is changed as well.
Default Windows icon for .txt is much better, so here's the trick:
1. Create the new key at `HKEY_CLASSES_ROOT\Applications\<program>\DefaultIcon`
2. Set default value to `C:\Windows\System32\Shell32.dll,70`
3. Run `C:\Windows\system32\ie4uinit.exe -show` to invalidate icons without reboot
