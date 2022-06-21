Write-Host "Module 1"
Set-ExecutionPolicy -ExecutionPolic RemoteSigned -Scope LocalMachine
Write-Host "LocalMachine ExecutionPolic:"; Get-ExecutionPolicy -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolic Restricted
Get-ExecutionPolicy -List