# Software Configurations
Collection of configuration files for programs with steep setup curve.

- [Software Configurations](#software-configurations)
  - [Firefox](#firefox)
  - [QTTabBar](#qttabbar)
  - [Tor](#tor)
  - [PowerShell](#powershell)
    - [PowerShell Core](#powershell-core)
    - [Useful modules](#useful-modules)
  - [ZSH](#zsh)
  - [Filebot](#filebot)
  - [Picard](#picard)

## Firefox
* Hide tab from top panel, see [file](/files/userChrome.css).
* Useful `about:config` params:
    ```ini
    browser.tabs.closeWindowWithLastTab=false
    dom.webnotifications.enabled=false
    ```
* For addon list see [Program Addons](ProgramAddons.md)

## QTTabBar
My default config for [QTTabBar](http://qttabbar.wikidot.com/), available [here](/files/QTTabBarConfig.xml). Use `Import settings` feature.


## Tor
1. Download [Tor Expert bundle](https://www.torproject.org/download/download.html.en)
2. Unpack it, path must be without spaces
3. Copy the following [config](/files/tor.config) somewhere
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


## PowerShell
### PowerShell Core
Cross-platform distribution, available [here](https://github.com/PowerShell/PowerShell/).

### Useful modules
1. Install modules (for `PowerShell` or `PowerShell Core`):
    ```powershell
    Install-Module DockerCompletion -Scope CurrentUser
    ```
    ```powershell
    Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
    ```
2. Google for other modules if required
3. Create [Microsoft.PowerShell_profile.ps1](/files/Microsoft.PowerShell_profile.ps1) file in:
    * `%HOME%/Documents/WindowsPowerShell/` for classic `PowerShell`
    * `%HOME%/Documents/PowerShell/` for `PowerShell Core`


## ZSH
1. Install `Oh My ZSH`:
    ```shell script
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```
2. Install plugins:
    ```shell script
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
    ```shell script
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
    ```
    ```shell script
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
    ```shell script
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
    ```
3. Enable installed plugins in `.zshrc`, e.g.:
    ```shell script
    plugins=(python pip npm node rust cargo archlinux colorize command-not-found git zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions zsh-completions)
    ```


## Filebot
Rename queries:
* For movies:
    ```
    {n.upperInitial().space(' ')} {'часть '+pi} {audio.language} [{vf}, {(video.bitrate[0].toFloat()/1000).round()}kbps] [{y}, {imdbid}, {certification}, {rating}][{crc32}]
    ```
* For series:
    ```
    {n.upperInitial()}/[{s00e00}] - {t} {audio.language} [{vf}, {(video.bitrate[0].toFloat()/1000).round()}kbps] [{y}, {imdbid}, {certification}, {rating}][{crc32}]
    ```


## Picard
Rename query:
```php
$replace($rreplace(
$if($eq(%albumartist%,Various Artists),
        [Various Artists],
	$left($if2(%albumartistsort%,%artistsort%),1)/$left($rreplace($if2(%albumartistsort%,%artistsort%),; [^\)]+,), 60))
/
$if(%date%,[$left(%date%,4)] )$left($replace(%album%,/,), 70)
$if($gt(%totaldiscs%,1),$if(%discnumber%, \(Disc %discnumber%\),),)
/
$num(%tracknumber%,2). $left(%title%,120),[:?"_]+,),  , )
```
