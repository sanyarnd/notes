##### Custom layout toggle

1. List all available toggle options:
`grep "grp:.*toggle" /usr/share/X11/xkb/rules/base.lst`
2. Tweak and run:
`localectl set-x11-keymap "us,ru" a4techKB21 "" "grp:caps_toggle,grp_led:scroll"`

In `GNOME` you may also want to check out `dconf`'s `input-sources/xkb-options`
