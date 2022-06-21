$FolderPath = “E:\Backup\AW”

If (Test-Path $FolderPath) {

Remove-Item $FolderPath -Force -Recurse -ErrorAction SilentlyContinue  } 

New-Item -ItemType directory -Path $FolderPath