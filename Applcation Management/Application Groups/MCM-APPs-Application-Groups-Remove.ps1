$GroupName = "Corporate Build"
$AppName   = "Adobe Acrobat Reader"

Set-CMApplicationGroup `
    -Name $GroupName `
    -RemoveApplication $AppName

Write-Host "Removed: $AppName" -ForegroundColor Green
Write-Host ""

$Group = Get-CMApplicationGroup -Name $GroupName

$Group.Applications | ForEach-Object {
    Write-Host " - $_"
}