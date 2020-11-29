Param(
    [Parameter(Mandatory=$false)]  [string]               $Directory      = "$PWD",
    [Parameter(Mandatory=$false)]  [string[]]             $FileExtensions = @("c","cpp","h","hpp","cs","java"),
    [Parameter(Mandatory=$false)]  [System.Text.Encoding] $Encoding       = (New-Object System.Text.UTF8Encoding $false)
)

Write-Output "Working in directory $Directory"

[string]$ossComment = @"
// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++, C#, and Java: http://www.viva64.com

"@

foreach ($ext in $FileExtensions) {
    [System.IO.FileSystemInfo[]]$files = Get-ChildItem -Recurse -Path $Directory -Filter "*.$ext"
    if ($files.Length -gt 0) {
        $i = 0
        $filesLength = $files.Length
        Write-Output "Total files with *.$ext extension: $filesLength"
        foreach ($file in $files) {
            Write-Progress -Activity "Processing *.$ext files..." -Status "Progress:" -PercentComplete (($i/$filesLength) * 100)

            [System.Collections.ArrayList]$content = [System.IO.File]::ReadAllLines($file.FullName, $Encoding)
            $content.Insert(0, $ossComment)
            [System.IO.File]::WriteAllLines($file.FullName, $content, $Encoding)

            $i = $i + 1
        }
    } else {
        Write-Output "Files with *.$ext extension are not found!"
    }
}
