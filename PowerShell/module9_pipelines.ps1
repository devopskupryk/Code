#Task1
$Arr0 = @()
Get-Process | Get-Unique | ForEach-Object {[string[]]$Arr0 += $_.ProcessName} | Sort-Object
$HT = @{}
Get-Service | Get-Unique | Where-Object {$_.Status.ToString() -eq "Running"} | ForEach-Object {$HT.Add($_.Name,$_.DisplayName)}
$EqHT = @{}
foreach ($ServiceName in $HT.GetEnumerator()) {
    foreach ($ProcName in $Arr0) {
        if ($ServiceName.Key.ToString() -eq $ProcName.ToString()) {
            $EqHT.Add($ServiceName.Key,$ServiceName.Value)
        }
    }
}
$EqHT
#Task2
$(Get-Content .\module9.txt).Split(" ") `
    | Group-Object `
        | Sort-Object -Property "Count" -Descending `
            | select -First 10 `
                | Format-Table