
$Str1 = -join("xyaabbbccccdefww".ToCharArray() | Get-Unique)
$Str2 = -join("xxxxyyyyabklmopq".ToCharArray() | Get-Unique)
-join(($Str1+$Str2).ToCharArray() | Sort-Object | Get-Unique)

$Str4 = "the-stealth-warrior".Split('-')
for ($i=0; $i -le ($Str4.Length - 1); $i++) {
    $Str4[$i] = $Str4[$i].Replace($Str4[$i][0],$Str4[$i][0].ToString().ToUpper())
}
-join($Str4)
-join("The_Stealth_Warrior".Split('_'))
