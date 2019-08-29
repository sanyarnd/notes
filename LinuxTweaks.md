# Windows Tweaks
Collection of ad-hoc solution for annoying `Linux`'s behavior.

- [Windows Tweaks](#windows-tweaks)
  - [Mounting](#mounting)
  - [Bumbleee and CUDA](#bumbleee-and-cuda)
  - [Faster AUR](#faster-aur)
  - [Input methods switch](#input-methods-switch)

## Mounting
Common mounting commands:

* Print UUID: `lsblk -f`
* Mount NTFS in `etc/fstab`:
    ```
    UUID=<some-uuid>  /mnt/windows  ntfs-3g  defaults,windows_names,user,exec  0  0
    ```
* Use `tmpfs` (mount `/tmp` in RAM):
    ```
    tmpfs /tmp  tmpfs defaults,noatime,mode=1777,nodev,nosuid,size=4G  0 0
    ```
* Use `nofail` option to avoid system failure in mounted drive is removable


## Bumbleee and CUDA
Check the status:
```shell script
cat /proc/acpi/bbswitch
```
If it's off, turn device on by writing `ON` value to `/proc/acpi/bbswitch`. 

To streamline the process, use [the following script](/files/cudarun), [author](https://gitlab.com/Queuecumber/cudarun).


## Faster AUR
Skip package compression, add the following changes to `/etc/makepkg.conf`:
```shell script
# PKGEXT='.pkg.tar.xz'
PKGEXT='.pkg.tar'
[...]
```
If you want use multiple cores, then change `$COMPRESSXZ` variable and add `-T 0`:
```shell script
COMPRESSXZ=(xz -T 0 -c -z -)
```


## Input methods switch
List all available options:
```shell script
grep "grp:.*toggle" /usr/share/X11/xkb/rules/base.lst
```
Tweak:
```shell script
localectl set-x11-keymap "us,ru" a4techKB21 "" "grp:caps_toggle,grp_led:scroll"
```

In `GNOME` you may also want to check out `dconf`'s `input-sources/xkb-options`
