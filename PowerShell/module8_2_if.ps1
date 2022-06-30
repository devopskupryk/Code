#Tast1
if ($args[0] -match "C") {
    [double]$C = $args[0] | Where-Object {$_ -match '\d{1,}'} | ForEach-Object {$Matches[0]}
    Write-Host $args[0].ToString() "is" $([Math]::Round($C*9/5 +32,2)) "in Fahrenheit"
}
elseif ($args[0] -match "F") {
    [double]$C = $args[0] | Where-Object {$_ -match '\d{1,}'} | ForEach-Object {$Matches[0]}
    Write-Host $args[0].ToString() "is" $([Math]::Round(($C-32)/9*5,2)) "in Celsius"
}
else {
    Write-Host "C or F?"
}