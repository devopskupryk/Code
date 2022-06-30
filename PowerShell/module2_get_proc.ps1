echo "Processes:"
Get-Process ((Get-Process).ProcessName -clike "S*")

echo "Service Cmdlets:"
(Get-Command -CommandType Cmdlet *Service).Verb

Get-Help Get-ChildItem -Online

Update-Help -Module (Get-Command New-Item).ModuleName