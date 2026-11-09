$Apps = (Get-CMApplicationGroup -Name $GroupName).Applications

Write-Host ""
Write-Host "Application Group: $GroupName"
Write-Host "Total Applications: $($Apps.Count)"
Write-Host ""

$Apps | Sort-Object | ForEach-Object {
    Write-Host "  $_"
}