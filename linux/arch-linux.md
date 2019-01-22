##### Faster AUR
To skip compression, you'll want to make the following change to your /etc/makepkg.conf:
```
#PKGEXT='.pkg.tar.xz'
PKGEXT='.pkg.tar'
[...]
```

To use multiple cores to compress, you're going to have to change the $COMPRESSXZ variable and add `-T 0`:
```
COMPRESSXZ=(xz -T 0 -c -z -)
```
