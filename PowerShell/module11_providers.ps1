#Tast1
$Arr = $(Get-Content .\module9.txt).Split(" ") `
    | Select-Object -Unique `
        | Sort-Object -Property Length -Descending `
            | Select-Object -First 10
[int]$i=1
foreach ($Word in $Arr) {
    $Word | Add-Content -Path "$i.txt"
    Write-Host "create the file $i.txt with word $Word"
    $i++
}
#Task2
$Arr = $(Get-Content .\module9.txt).Split(" ") `
    | Sort-Object -Unique | Where-Object {$_ -notmatch '[\(,\d,]'}
foreach ($Word in $Arr) {
    $Word | Add-Content -Path "$($Word.ToUpper()[0]).txt"
    Write-Host "Add word '$Word' to the file $($Word.ToUpper()[0]).txt"
}
