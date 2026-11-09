Import-Module ($ENV:SMS_ADMIN_UI_PATH.Substring(0,$ENV:SMS_ADMIN_UI_PATH.Length-5) + '\ConfigurationManager.psd1')

cd CHQ:

# Create an Application Group
$Apps = @(
    "Google Chrome Enterprise",
    "Microsoft Edge Enterprise",
    "7-Zip 26.04 x64"
)

New-CMApplicationGroup `
    -Name "Core Workstation Apps" `
    -AddApplication $Apps `
    -Description "Standard corporate applications" `
    -Publisher "Košec Solutions" `
    -SoftwareVersion "1.0"

# Verify the Group
Get-CMApplicationGroup -Name "Core Workstation Apps"

# Deploy the Application Group
New-CMApplicationGroupDeployment `
    -Name "Core Workstation Apps" `
    -CollectionName "Wave-1" `
    -DeployAction Install `
    -DeployPurpose Available

# Enterprise Example
$Apps = Get-CMApplication |
    Where-Object LocalizedDisplayName -in @(
        "Microsoft Edge Enterprise",
        "Google Chrome Enterprise",
        "7-Zip 26.04 x64",
        "PowerShell 7"
    ) |
    Select-Object -ExpandProperty LocalizedDisplayName

New-CMApplicationGroup `
    -Name "Corporate Build" `
    -AddApplication $Apps `
    -Description "Default application set for new devices"

# Modify an Existing Group
Set-CMApplicationGroup `
    -Name "Corporate Build" `
    -AddApplication "Adobe Acrobat Reader"

# Remove Applications
Set-CMApplicationGroup `
    -Name "Corporate Build" `
    -RemoveApplication "Adobe Acrobat Reader"