
##### Print UUID
`lsblk -f`

##### Mount NTFS
```
UUID=AAAA   /mnt/windows    ntfs-3g     defaults,windows_names,user,exec  0 0
```

##### Use tmpfs (mount `/tmp` to RAM)
```
tmpfs   /tmp    tmpfs   defaults,noatime,mode=1777,nodev,nosuid,size=8G     0 0
```
Don't forget to specify size

##### Removable HDD
To prevent loading failure when you have added removable device and it doesn't load anymore (broken, missing), add option `nofail`.


##### systemd mountpoints
As an alternative to `/etc/fstab`, you can use `systemd` mountpoints. It has no benefit in static configuration (because `systemd` will essentially populate `fstab`), but if your problem is more complex, then it's a way to go.
