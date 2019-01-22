##### Remove OneDrive from Explorer:
`HKEY_CURRENT_USER\SOFTWARE\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}`
`System.IsPinnedToNameSpaceTree` -> 0

##### PATH record length limit
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem`
`LongPathsEnabled` -> 1
