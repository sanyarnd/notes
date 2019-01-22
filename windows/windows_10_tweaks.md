##### Remove OneDrive from Explorer:
```HKEY_CURRENT_USER\SOFTWARE\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}```

Value `System.IsPinnedToNameSpaceTree` to `0`

##### PATH's entry length limit
```HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem```

Value `LongPathsEnabled` to `1`

##### Make Windows use UTC time
Run the following as administrator
```cmd
Reg add HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation /v RealTimeIsUniversal /t REG_QWORD /d 1
```
