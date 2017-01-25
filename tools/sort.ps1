$RootPath = Split-Path $PSScriptRoot
$Files = Get-ChildItem $RootPath

foreach ($file in $Files)
{
    $filename = $file.ToString();
    if($filename -eq "tools" -or $filename -eq "LICENSE" -or $filename -eq "README.md" -or $filename -eq "USERS.md"){continue}
    #manual skips on non ASCII languages.
    if($filename -eq "ar"){continue}
    if($filename -eq "emoji"){continue}
    if($filename -eq "fa"){continue}
    if($filename -eq "ja"){continue}
    if($filename -eq "ko"){continue}
    if($filename -eq "ru"){continue} #this might actually work, needs testing.
    if($filename -eq "th"){continue}
    if($filename -eq "zh"){continue}
    Write-Host " --- Sorting ----  " $file  
    $content = Get-Content $file.FullName -encoding Unicode | sort | get-unique
    $content | Out-File $file.FullName -encoding Unicode
}
