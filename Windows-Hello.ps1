# Window Message
$Shell = New-Object -ComObject "WScript.Shell"
$Button = $Shell.Popup ("Click OK to continue", 0, "Hello", 0)
