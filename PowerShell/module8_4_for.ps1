#Task3
[double[]]$Arr2 += '0' 
for ($i=1; $i -le $args[0]; $i++) {
        if ($i -le 2) {
        $Arr2 += $Arr2[$i-1] + 10.5
    }
    else {
        $Arr2 += $Arr2[$i-1] + 4
    }
}
write-host $Arr2 -NoNewline