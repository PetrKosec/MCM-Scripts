$GroupName = "Corporate Build"
$AppName   = "Adobe Acrobat Reader"

$Group = Get-CMApplicationGroup -Name $GroupName

if ($Group.Applications -contains $AppName) {

    Set-CMApplicationGroup `
        -Name $GroupName `
        -RemoveApplication $AppName

    Write-Host "Successfully removed: $AppName" -ForegroundColor Green
}
else {
    Write-Warning "$AppName not found in Application Group $GroupName"
}

Write-Host ""
Write-Host "Current membership:" -ForegroundColor Cyan

(Get-CMApplicationGroup -Name $GroupName).Applications |
    Sort-Object |
    ForEach-Object { Write-Host " - $_" }