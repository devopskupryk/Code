#Task2
[int[]]$Arr += '0'
[int[]]$i=1
while ( $i -le $args[0]) {
    $Arr += $i
    $i = $Arr[$Arr.Count-2]+$Arr[$Arr.Count-1]
}
write-host $Arr -NoNewline