#Task1
$(-Split($args[0], " ")) | Where-Object {$_ -match '[-_]'}
#Task2
$arr = -split($args[0], " ")
write-host "The last word in the string is:", $arr[$arr.Length - 2]
#Task3
$args[0].ToString() | Where-Object {$_ -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'} | ForEach-Object {$Matches[0]}
#Task4
$tm = $args[0].ToString().Split("-") 
-join($tm[1],"-",$tm[0],"-",$tm[2])
#Task5
$args[0].ToString().Split(" ") `
| Where-Object {($_.Length -ge 6) -and ($_ -notmatch '\d') -and ($_ -match '[a-z]{6,}')} `
| ForEach-Object {$Matches[0]}
#Task6
$args[0].ToString().Replace("  ","")
