# Tor

## Windows
1. Download [Tor Expert bundle](https://www.torproject.org/download/download.html.en)
2. Unpack it, path must be without spaces
3. Copy the following [config](/_files/tor.config) somewhere
4. Run as admin the following code to regiqster Tor as system service:
    ```bat
    C:\Portable\Tor\Tor\tor.exe --service install -options -f C:\Portable\Tor\Data\Tor\tor.config
    ```
5. Use bridges if you can't connect to Tor Network. The most common way is `obfs4proxy`. Download and put executable somewhere at your disk and register plugin:
    ```bat
    ClientTransportPlugin obfs4 exec C:/Portable/tor/tor/PluggableTransports/obfs4proxy.exe managed
    ```
    `obfs4proxy` builds are not available for `Windows`, but it is bundled with `Tor Browser`. You can take an `.exe` from the here.
6. Append the bridge list to `tor.config` (don't forget `UseBridges 1`):
    ```
    Bridge obfs4 154.35.22.13:16815 FE7840FE1E21FE0A0639ED176EDA00A3ECA1E34D cert=fKnzxr+m+jWXXQGCaXe4f2gGoPXMzbL+bTBbXMYXuK0tMotd+nXyS33y2mONZWU29l81CA iat-mode=0
    Bridge obfs4 109.105.109.165:10527 8DFCD8FB3285E855F5A55EDDA35696C743ABFC4E cert=Bvg/itxeL4TWKLP6N1MaQzSOC6tcRIBv6q57DYAZc3b2AzuM+/TfB7mqTFEfXILCjEwzVA iat-mode

    ...

    UseBridges 1
    ```
7. You can retreive bridge list from many website, e.g. like [this](https://bridges.torproject.org/bridges?transport=obfs4).


## Linux
Install TOR, enable systemd daemon, tweak `/etc/tor/torrc` as required.