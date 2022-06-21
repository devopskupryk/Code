#Task1. Write a script to get list of process (ex. All chrome process) and put Name, Id, StartTime, PagedMemorySize in CSV/XML/JSON/YAML files where possible.

Get-Process -Name "chrome" | ConvertTo-Csv | Add-Content -Path chrome.csv
Get-Process -Name "chrome" | ConvertTo-Json | Add-Content -Path chrome.json
$xml = [xml]$(Get-Process -Name "chrome" | ConvertTo-Xml -Depth 2)
$xml.Save($(Resolve-Path ./).Path + ".\chrome.xml")
#Install-Module -Name powershell-yaml
#Get-Module -Name "powershell-yaml" -ListAvailable
$processes = Get-Process -Name "chrome"
$HT = foreach($process in $processes) { @{ $processes.indexof($process) = @{Name = "$($process.name)"; Id = $process.id; Path = "$($process.path)"} } }
$HT[0].Values
ConvertTo-Yaml -Data $HT -OutFile $($(Resolve-Path ./).Path + ".\chrome.yaml") -Force
#Task2. Write a script to create hash-tables based on data that stored in files from task 1.
Get-Content -Path chrome.csv | ConvertFrom-Csv
#Get-Content -Path chrome.json | ConvertFrom-Json
$xmldata = [xml]$(Get-Content -Path chrome.xml)
$xmldata
$HTOut = ConvertFrom-Yaml -Yaml $($(Get-Content .\chrome.yaml) -join "`n")
$HTOut[0].Values 