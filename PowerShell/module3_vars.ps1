[string]$StrVar = 19790525
echo "StrVar: $StrVar"
$HomeDir = Get-ChildItem $HOME
$HomeDir | Format-Table
$HomeDir.GetType() | Format-Table

$HomeFile = Get-Content $HOME\module2.ps1
Write-Host ($HomeFile) -ForegroundColor Yellow
$HomeFile.GetType() | Format-Table

$DownloadsDir = Get-ChildItem -Directory $HOME\Downloads
$DownloadsDir | Format-Table
$DownloadsDir.GetType() | Format-Table