1. Download [Tor Expert bundle](https://www.torproject.org/download/download.html.en)
2. Unpack it, path without spaces
3. Copy the following config somewhere

torrc:
```
ControlPort 9151
CookieAuthentication 1

SocksPort 9050

# List any country you want
ExcludeExitNodes {ru},{ua},{by},{kz},{??}
StrictNodes 1

# Modify path
DataDirectory C:/Portable/tor/Data/Tor
GeoIPFile C:/Portable/tor/Data/Tor/geoip
GeoIPv6File C:/Portable/tor/Data/Tor/geoip6
```

4. Run as the service
```
C:\Portable\Tor\Tor\tor.exe --service install -options -f C:\Portable\Tor\Data\Tor\torrc
```


5. If you have issues, use bridges:
```
```
