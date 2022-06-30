#Get-Content "C:\Tmp\module9.txt"
#$(Get-Content "C:\Tmp\module9.txt").Split(" ")
$(Get-Content .\module9.txt).Split(" ") | Group-Object | Sort-Object -Property "Count" -Descending | select -First 10 | Format-Table