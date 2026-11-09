$tpm = Get-Tpm
$tpm.Pcrs

Get-TpmSupportedFeature


$tpm = Get-WmiObject -Namespace "Root\CIMV2\Security\MicrosoftTpm" -Class Win32_Tpm
$tpm.GetPcrValues(0..23)
