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

4. Run as admin the following code to regiqster Tor as system service (run at startup):
```
C:\Portable\Tor\Tor\tor.exe --service install -options -f C:\Portable\Tor\Data\Tor\torrc
```


5. If you have issues, use bridges. The most common way is using obfs4proxy. 
You'll need download it and put somewhere in your disk and provide path to the executable:
```
ClientTransportPlugin obfs4 exec C:/Portable/tor/tor/PluggableTransports/obfs4proxy.exe managed
```
obfs4proxy builds are not available for `Windows`, but it is bundled with `Tor Browser`. You can take an .exe from the bundle.

6. After that get list of the bridges and put them like this (don't forget `UseBridges 1`):
```
Bridge obfs4 154.35.22.13:16815 FE7840FE1E21FE0A0639ED176EDA00A3ECA1E34D cert=fKnzxr+m+jWXXQGCaXe4f2gGoPXMzbL+bTBbXMYXuK0tMotd+nXyS33y2mONZWU29l81CA iat-mode=0
Bridge obfs4 109.105.109.165:10527 8DFCD8FB3285E855F5A55EDDA35696C743ABFC4E cert=Bvg/itxeL4TWKLP6N1MaQzSOC6tcRIBv6q57DYAZc3b2AzuM+/TfB7mqTFEfXILCjEwzVA iat-mode=1
Bridge obfs4 154.35.22.10:15937 8FB9F4319E89E5C6223052AA525A192AFBC85D55 cert=GGGS1TX4R81m3r0HBl79wKy1OtPPNR2CZUIrHjkRg65Vc2VR8fOyo64f9kmT1UAFG7j0HQ iat-mode=0
Bridge obfs4 109.105.109.147:13764 BBB28DF0F201E706BE564EFE690FE9577DD8386D cert=KfMQN/tNMFdda61hMgpiMI7pbwU1T+wxjTulYnfw+4sgvG0zSH7N7fwT10BI8MUdAD7iJA iat-mode=2
Bridge obfs4 37.218.245.14:38224 D9A82D2F9C2F65A18407B1D2B764F130847F8B5D cert=bjRaMrr1BRiAW8IE9U5z27fQaYgOhX1UCmOpg2pFpoMvo6ZgQMzLsaTzzQNTlm7hNcb+Sg iat-mode=0
Bridge obfs4 83.212.101.3:50002 A09D536DD1752D542E1FBB3C9CE4449D51298239 cert=lPRQ/MXdD1t5SRZ9MquYQNT9m5DV757jtdXdlePmRCudUU9CFUOX1Tm7/meFSyPOsud7Cw iat-mode=0
Bridge obfs4 154.35.22.9:443 C73ADBAC8ADFDBF0FC0F3F4E8091C0107D093716 cert=gEGKc5WN/bSjFa6UkG9hOcft1tuK+cV8hbZ0H6cqXiMPLqSbCh2Q3PHe5OOr6oMVORhoJA iat-mode=0
Bridge obfs4 38.229.33.83:80 0BAC39417268B96B9F514E7F63FA6FBA1A788955 cert=VwEFpk9F/UN9JED7XpG1XOjm/O8ZCXK80oPecgWnNDZDv5pdkhq1OpbAH0wNqOT6H6BmRQ iat-mode=1
Bridge obfs4 [2001:470:b381:bfff:216:3eff:fe23:d6c3]:443 CDF2E852BF539B82BD10E27E9115A31734E378C2 cert=qUVQ0srL1JI/vO6V6m/24anYXiJD3QP2HgzUKQtQ7GRqqUvs7P+tG43RtAqdhLOALP7DJQ iat-mode=1
Bridge obfs4 154.35.22.13:443 FE7840FE1E21FE0A0639ED176EDA00A3ECA1E34D cert=fKnzxr+m+jWXXQGCaXe4f2gGoPXMzbL+bTBbXMYXuK0tMotd+nXyS33y2mONZWU29l81CA iat-mode=0
Bridge obfs4 85.31.186.26:443 91A6354697E6B02A386312F68D82CF86824D3606 cert=PBwr+S8JTVZo6MPdHnkTwXJPILWADLqfMGoVvhZClMq/Urndyd42BwX9YFJHZnBB3H0XCw iat-mode=0
Bridge obfs4 85.31.186.98:443 011F2599C0E9B27EE74B353155E244813763C3E5 cert=ayq0XzCwhpdysn5o0EyDUbmSOx3X/oTEbzDMvczHOdBJKlvIdHHLJGkZARtT4dcBFArPPg iat-mode=0
Bridge obfs4 154.35.22.11:16488 A832D176ECD5C7C6B58825AE22FC4C90FA249637 cert=YPbQqXPiqTUBfjGFLpm9JYEFTBvnzEJDKJxXG5Sxzrr/v2qrhGU4Jls9lHjLAhqpXaEfZw iat-mode=0
Bridge obfs4 154.35.22.11:80 A832D176ECD5C7C6B58825AE22FC4C90FA249637 cert=YPbQqXPiqTUBfjGFLpm9JYEFTBvnzEJDKJxXG5Sxzrr/v2qrhGU4Jls9lHjLAhqpXaEfZw iat-mode=0
Bridge obfs4 37.218.240.34:40035 88CD36D45A35271963EF82E511C8827A24730913 cert=eGXYfWODcgqIdPJ+rRupg4GGvVGfh25FWaIXZkit206OSngsp7GAIiGIXOJJROMxEqFKJg iat-mode=1
Bridge obfs4 154.35.22.9:12166 C73ADBAC8ADFDBF0FC0F3F4E8091C0107D093716 cert=gEGKc5WN/bSjFa6UkG9hOcft1tuK+cV8hbZ0H6cqXiMPLqSbCh2Q3PHe5OOr6oMVORhoJA iat-mode=0
Bridge obfs4 192.99.11.54:443 7B126FAB960E5AC6A629C729434FF84FB5074EC2 cert=VW5f8+IBUWpPFxF+rsiVy2wXkyTQG7vEd+rHeN2jV5LIDNu8wMNEOqZXPwHdwMVEBdqXEw iat-mode=0
Bridge obfs4 192.95.36.142:443 CDF2E852BF539B82BD10E27E9115A31734E378C2 cert=qUVQ0srL1JI/vO6V6m/24anYXiJD3QP2HgzUKQtQ7GRqqUvs7P+tG43RtAqdhLOALP7DJQ iat-mode=1
Bridge obfs4 38.229.1.78:80 C8CBDB2464FC9804A69531437BCF2BE31FDD2EE4 cert=Hmyfd2ev46gGY7NoVxA9ngrPF2zCZtzskRTzoWXbxNkzeVnGFPWmrTtILRyqCTjHR+s9dg iat-mode=1
Bridge obfs4 154.35.22.11:443 A832D176ECD5C7C6B58825AE22FC4C90FA249637 cert=YPbQqXPiqTUBfjGFLpm9JYEFTBvnzEJDKJxXG5Sxzrr/v2qrhGU4Jls9lHjLAhqpXaEfZw iat-mode=0
Bridge obfs4 154.35.22.12:4304 00DC6C4FA49A65BD1472993CF6730D54F11E0DBB cert=N86E9hKXXXVz6G7w2z8wFfhIDztDAzZ/3poxVePHEYjbKDWzjkRDccFMAnhK75fc65pYSg iat-mode=0
Bridge obfs4 154.35.22.12:80 00DC6C4FA49A65BD1472993CF6730D54F11E0DBB cert=N86E9hKXXXVz6G7w2z8wFfhIDztDAzZ/3poxVePHEYjbKDWzjkRDccFMAnhK75fc65pYSg iat-mode=0
Bridge obfs4 154.35.22.10:80 8FB9F4319E89E5C6223052AA525A192AFBC85D55 cert=GGGS1TX4R81m3r0HBl79wKy1OtPPNR2CZUIrHjkRg65Vc2VR8fOyo64f9kmT1UAFG7j0HQ iat-mode=0
Bridge obfs4 216.252.162.21:46089 0DB8799466902192B6C7576D58D4F7F714EC87C1 cert=XPUwcQPxEXExHfJYX58gZXN7mYpos7VNAHbkgERNFg+FCVNzuYo1Wp+uMscl3aR9hO2DRQ iat-mode=0
Bridge obfs4 85.17.30.79:443 FC259A04A328A07FED1413E9FC6526530D9FD87A cert=RutxZlu8BtyP+y0NX7bAVD41+J/qXNhHUrKjFkRSdiBAhIHIQLhKQ2HxESAKZprn/lR3KA iat-mode=0
Bridge obfs4 154.35.22.10:443 8FB9F4319E89E5C6223052AA525A192AFBC85D55 cert=GGGS1TX4R81m3r0HBl79wKy1OtPPNR2CZUIrHjkRg65Vc2VR8fOyo64f9kmT1UAFG7j0HQ iat-mode=0
Bridge obfs4 154.35.22.9:80 C73ADBAC8ADFDBF0FC0F3F4E8091C0107D093716 cert=gEGKc5WN/bSjFa6UkG9hOcft1tuK+cV8hbZ0H6cqXiMPLqSbCh2Q3PHe5OOr6oMVORhoJA iat-mode=0

UseBridges 1
```
7. There are many websites to get relevant tor bridges list, like [this](https://bridges.torproject.org/bridges?transport=obfs4).