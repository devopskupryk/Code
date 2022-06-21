[string[]]$Arr = @(("1","2"),("3","4"))
$Arr

$HT1 = [ordered]@{a=1;b=2}
$HT2 = [ordered]@{c=3;d=4}
$HT3 = [ordered]@{e=5;f=6}

$Arr1= @($HT1,$HT2,$HT3)
$($Arr1[2].GetEnumerator())[1]

$HT4 = @{1=$HT1;2=$HT2}
$($HT4.2).d

$HT5 = @{a=12;g=4;h=1;t=7;d=8}
$HT5.GetEnumerator() | sort -Property Value | Format-Table
