$GroupName = "Corporate Build"
$AppName   = "Adobe Acrobat Reader"

# Odebrání aplikace
Set-CMApplicationGroup `
    -Name $GroupName `
    -RemoveApplication $AppName

Write-Host ""
Write-Host "Application removed: $AppName" -ForegroundColor Green
Write-Host ""

# Výpis aktuálních aplikací ve skupině
$Group = Get-CMApplicationGroup -Name $GroupName

Write-Host "Current applications in Application Group '$GroupName':" -ForegroundColor Cyan

$Group.SDMPackageXML |
Out-String