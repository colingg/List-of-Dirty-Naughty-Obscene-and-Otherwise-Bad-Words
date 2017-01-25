$RootPath = Split-Path $PSScriptRoot
$Files = Get-ChildItem $RootPath

foreach ($file in $Files)
{
    $filename = $file.ToString();
    if($filename -eq "tools" -or $filename -eq "LICENSE" -or $filename -eq "README.md" -or $filename -eq "USERS.md"){continue}
    #manual skips on non ASCII languages.
    Write-Host " --- Sorting ----  " $file  
    $content = Get-Content $file.FullName -encoding UTF8 | sort | get-unique
    $content | Out-File $file.FullName -encoding UTF8
}
