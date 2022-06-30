#Tast1
[double]$C = $args[0] | Where-Object {$_ -match '\d{1,}'} | ForEach-Object {$Matches[0]}
if ($args[0] -match "C") {
    Write-Host $args[0] "is" $([Math]::Round($C*9/5 +32,2)) "in Fahrenheit"
}
elseif ($args[0] -match "F") {
    Write-Host $args[0] "is" $([Math]::Round(($C-32)/9*5,2)) "in Celsius"
}
else {
    Write-Host "C or F?"
}
#Task2
[int[]]$Arr += '0'
[int[]]$i=1
while ( $i -le $C) {
    $Arr += $i
    $i = $Arr[$Arr.Count-2]+$Arr[$Arr.Count-1]
}
write-host "Fibonacci" $C ":" $Arr -NoNewline
write-host ""
#Task3
[double[]]$Arr2 += '0' 
for ($j=1; $j -le $C; $j++) {
        if ($j -le 2) {
        $Arr2 += $Arr2[$j-1] + 10.5
    }
    else {
        $Arr2 += $Arr2[$j-1] + 4
    }
}
write-host "Dog's age" $C ":" $Arr2 -NoNewline
write-host ""
#Task4
for ($k=1; $k -le 10; $k++) {
    Write-Host $C "x" $k "=" $($C*$k)
}