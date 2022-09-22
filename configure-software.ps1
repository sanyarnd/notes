[CmdletBinding()]
Param()

function Log-Message
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$LogMessage
    )

    Write-Output ("{0} - {1}" -f (Get-Date), $LogMessage)
}

Log-Message "Install basic software"

$DefaultDownloadDestination = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
$LocalBinFolder = "$env:USERPROFILE\.bin"

$ExeApps = @(
    "https://www.rarlab.com/rar/winrar-x64-611ru.exe",
    "https://nav.dl.sourceforge.net/project/sevenzip/7-Zip/22.01/7z2201-x64.msi",
    "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.4/npp.8.4.4.Installer.x64.exe",

    "https://www.sumatrapdfreader.org/dl/rel/3.4.6/SumatraPDF-3.4.6-64-install.exe",
    "https://github.com/d2phap/ImageGlass/releases/download/8.6.7.13/ImageGlass_Kobe_8.6.7.13_x64.msi",
    
    "https://aimp.ru/files/windows/builds/aimp_5.03.2397_w64.exe",
    "https://www.foobar2000.org/getfile/foobar2000_v1.6.11.exe",

    "https://github.com/audacity/audacity/releases/download/Audacity-3.1.3/audacity-win-3.1.3-64bit.exe",
    "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-27.2.4-Full-Installer-x64.exe",

    "https://github.com/stefansundin/altdrag/releases/download/v1.1/AltDrag-1.1.exe",
    "https://www.voidtools.com/Everything-1.4.1.1017.x64.Lite-Setup.exe",
    "https://github.com/sabrogden/Ditto/releases/download/3.24.214.0/DittoSetup_64bit_3_24_214_0.exe",
    "https://github.com/keepassxreboot/keepassxc/releases/download/2.7.1/KeePassXC-2.7.1-Win64.msi",

    "https://download.cpuid.com/cpu-z/cpu-z_2.01-en.exe",
    "https://www.fosshub.com/HWiNFO.html?dwl=hwi_726.exe",
    "https://www.diskanalyzer.com/files/wiztree_4_08_setup.exe",
    "https://registry-finder.com/bin/2.54.0.0/RegistryFinderSetup2.54.exe",

    "https://github.com/telegramdesktop/tdesktop/releases/download/v4.0.2/tsetup-x64.4.0.2.exe",
    "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=ru"
    "https://www.torproject.org/dist/torbrowser/11.5.1/torbrowser-install-win64-11.5.1_en-US.exe",
    "https://www.fosshub.com/qBittorrent.html?dwl=qbittorrent_4.4.3.1_qt6_x64_setup.exe",
    
    "https://download.anydesk.com/AnyDesk.exe",
    "https://disk.yandex.ru/download/YandexDisk30Setup.exe",

    "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86"
    "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe",
    "https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe",
    "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi",
    
    "https://github.com/git-for-windows/git/releases/download/v2.37.1.windows.1/Git-2.37.1-64-bit.exe",
    "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.25.12627.exe",
    "https://dbeaver.io/files/dbeaver-ce-latest-x86_64-setup.exe",
    "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
    "https://www.python.org/ftp/python/3.11.0/python-3.11.0rc1-amd64.exe",
    "https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe",
    "https://nodejs.org/dist/v16.16.0/node-v16.16.0-x64.msi",
    "https://c2rsetup.officeapps.live.com/c2r/downloadVS.aspx?sku=professional&channel=Release&version=VS2022"
    "https://github.com/mridgers/clink/releases/download/0.4.9/clink_0.4.9_setup.exe",
    "https://files.gpg4win.org/gpg4win-4.0.3.exe"
)

$MsixApps = @(
    "https://github.com/microsoft/terminal/releases/download/v1.15.2002.0/Microsoft.WindowsTerminalPreview_Win11_1.15.2003.0_8wekyb3d8bbwe.msixbundle"
)

$ZipApps = @(
    @{ url = "https://mh-nexus.de/downloads/HxDSetup.zip"; exePath = "HxDSetup.exe" }
)



function Get-Remote-File {
    param (
        [string] $Url,
        [string] $Destination = $DefaultDownloadDestination
    )
    $response = [System.Net.WebRequest]::Create($Url).GetResponse()
    $disposition = $response.Headers['Content-Disposition']

    if (([string]::IsNullOrEmpty($disposition)) -or ($disposition -eq "attachment")) {
        $fileName = Split-Path $Url -Leaf
    }
    else {
        $fileName = [System.Net.Mime.ContentDisposition]::new($disposition).FileName
    }

    $file = "$Destination\$fileName"
    if (Test-Path -Path $file -PathType Leaf) {
        return $file
    }

    Log-Message "Downloading $fileName / $Url"
    $webClient = New-Object net.webclient
    $webClient.Downloadfile($Url, $file)
    Log-Message "Download completed"

    return $file
}

function Install-ExecAppFromUrl {
    param (
        [string] $Url
    )
    $file = Get-Remote-File -Url $Url

    Log-Message "Installing $file"
    Start-Process -FilePath $file -Wait
    Log-Message "Installation completed"
}

function Install-ZipAppFromUrl {
    param (
        [string] $Url,
        [string] $ExePath,
        [string] $Destination = $DefaultDownloadDestination
    )
    $file = Get-Remote-File -Url $Url
    Expand-Archive -Path $file -DestinationPath $Destination

    $fullExePath = "$Destination\$ExePath"

    Log-Message "Installing $fullExePath"
    Start-Process -FilePath $fullExePath -Wait
    Log-Message "Installation completed"
}

function Install-Font {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [String]$FontPath,

        [Switch]$Recurse
    )

    $ErrorActionPreference = 'Stop'
    $ShellAppFontNamespace = 0x14

    if (Test-Path -Path $FontPath) {
        $FontItem = Get-Item -Path $FontPath
        if ($FontItem -is [IO.DirectoryInfo]) {
            if ($Recurse) {
                $Fonts = Get-ChildItem -Path $FontItem -Include ('*.fon','*.otf','*.ttc','*.ttf') -Recurse
            } else {
                $Fonts = Get-ChildItem -Path "$FontItem\*" -Include ('*.fon','*.otf','*.ttc','*.ttf')
            }

            if (!$Fonts) {
                throw ('Unable to locate any fonts in provided directory: {0}' -f $FontItem.FullName)
            }
        } elseif ($FontItem -is [IO.FileInfo]) {
            if ($FontItem.Extension -notin ('.fon','.otf','.ttc','.ttf')) {
                throw ('Provided file does not appear to be a valid font: {0}' -f $FontItem.FullName)
            }

            $Fonts = $FontItem
        } else {
            throw ('Expected directory or file but received: {0}' -f $FontItem.GetType().Name)
        }
    } else {
        throw ('Provided font path does not appear to be valid: {0}' -f $FontPath)
    }

    $ShellApp = New-Object -ComObject Shell.Application
    $FontsFolder = $ShellApp.NameSpace($ShellAppFontNamespace)
    foreach ($Font in $Fonts) {
        Write-Verbose -Message ('Installing font: {0}' -f $Font.BaseName)
        $FontsFolder.CopyHere($Font.FullName)
    }
}


# --------------------------------------------------------

foreach ($url in $ExeApps) {
    try {
        Install-ExecAppFromUrl -Url $url        
    }
    catch {
        Log-Message "Unable to install ${url}:"
        Log-Message "$_"
    }
}

foreach ($app in $ZipApps) {
    try {
        Install-ZipAppFromUrl -Url $app.url -ExePath $app.exePath
    }
    catch {
        Log-Message "Unable to install ${url}:"
        Log-Message "$_"
    }
}

foreach ($url in $MsixApps) {
    try {
        $file = Get-Remote-File $app
        Log-Message "Installing $file"
        add-appxpackage $file
    }
    catch {
        Log-Message "Unable to install ${url}:"
        Log-Message "$_"
    }
}


# Portables
$mpv = Get-Remote-File "https://deac-fra.dl.sourceforge.net/project/mpv-player-windows/64bit/mpv-x86_64-20220807-git-9add44b.7z"
Start-Process -FilePath "C:\Program Files\7-Zip\7z" -ArgumentList @("x", "-o$DefaultDownloadDestination\mpv", "$mpv") -Wait -NoNewWindow
New-Item -Path "$env:LOCALAPPDATA\Programs\mpv" -ItemType "Directory" -Force
Copy-Item -Path "$DefaultDownloadDestination\mpv\*" -Destination "$env:LOCALAPPDATA\Programs\mpv" -Force -Recurse
Start-Process -FilePath "$env:LOCALAPPDATA\Programs\mpv\installer\mpv-install.bat" -Wait -verb runas


# Path
New-Item -Path $LocalBinFolder -ItemType "Directory" -Force
$env:path += ';'

$ytdlp = Get-Remote-File "https://github.com/yt-dlp/yt-dlp/releases/download/2022.08.08/yt-dlp.exe"
Copy-Item -Path $ytdlp -Destination "$LocalBinFolder/yt-dlp.exe"

$gallerydl = Get-Remote-File "https://github.com/mikf/gallery-dl/releases/download/v1.22.4/gallery-dl.exe"
Copy-Item -Path $gallerydl -Destination "$LocalBinFolder/gallery-dl.exe"

$rufus = Get-Remote-File "https://github.com/pbatard/rufus/releases/download/v3.20/rufus-3.20p.exe"
Copy-Item -Path $rufus -Destination "$LocalBinFolder/rufus.exe"

$ffmpeg = Get-Remote-File "https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z"
Start-Process -FilePath "C:\Program Files\7-Zip\7z" -ArgumentList @("x", "-o$DefaultDownloadDestination\ffmpeg", "$ffmpeg") -Wait -NoNewWindow
Copy-Item -Path "$DefaultDownloadDestination\ffmpeg\**\bin\ffmpeg.exe" -Destination "$LocalBinFolder\ffmpeg.exe"
Copy-Item -Path "$DefaultDownloadDestination\ffmpeg\**\bin\ffplay.exe" -Destination "$LocalBinFolder\ffplay.exe"
Copy-Item -Path "$DefaultDownloadDestination\ffmpeg\**\bin\ffprobe.exe" -Destination "$LocalBinFolder\ffprobe.exe"

$androidTools = Get-Remote-File "https://dl.google.com/android/repository/platform-tools_r33.0.2-windows.zip"
Expand-Archive -Path $androidTools -DestinationPath "$DefaultDownloadDestination" -Force
New-Item -Path "$LocalBinFolder\platform-tools" -ItemType "Directory" -Force
Copy-Item -Path "$DefaultDownloadDestination\platform-tools\*" -Destination "$LocalBinFolder\platform-tools" -Force -Recurse

# Add to path
$CurrentPath = [Environment]::GetEnvironmentVariable('Path', 'User') + ";$LocalBinFolder"
$CleanedPath = $CurrentPath -split ';' | Select-Object -Unique
$NewPath = $CleanedPath -join ';'
[Environment]::SetEnvironmentVariable('Path', $NewPath,'User')

# Fonts
Log-Message "Install fonts"
Expand-Archive -Path ".\fonts\Fira-Code-6.2-NF.zip" -Destination "$DefaultDownloadDestination\fonts"
Expand-Archive -Path ".\fonts\PT-Public-Pack-12.08.2022.zip" -Destination "$DefaultDownloadDestination\fonts"
Install-Font -FontPath "$DefaultDownloadDestination\fonts"
Log-Message "Fonts installed"

# WSL
Log-Message "Activate WSL"
Start-Process "wsl" -ArgumentList @("--install") -Wait -NoNewWindow
Log-Message "Set default WSL version to 2"
Start-Process "wsl" -ArgumentList @("--set-default-version", "2") -Wait -NoNewWindow
Log-Message "Install latest WSL kernel"
Install-ExecAppFromUrl -Url "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"


