
$Table = @()
for ($i=0; $i -le 999; $i++) {
    #Write-Host $i
    $row = New-Object System.Object
    $row | Add-Member -MemberType NoteProperty -Name "ID" -Value $i
    $row | Add-Member -MemberType NoteProperty -Name "Title" -Value Title$i
  
    $Table += $row      
}
$Table | Export-Csv table.csv -NoTypeInformation

bcp Lab6.dbo.Lab6table format nul -x -f E:\Backup\Lab6tables.xml -c -T
bcp Lab6.dbo.Lab6table OUT E:\Backup\Lab6tables.bcp -c -T

bcp Lab6.dbo.Lab6table IN E:\Backup\Lab6tables.bcp -S LAB1SRV1\NamedMSSQLSERVER -f E:\Backup\Lab6tables.xml -T