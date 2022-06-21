<#Task1.      Write a script to get from selected remote computer the following data:
CPU model and max clock speed
Amount of RAM (total, free)
OS disk free space
OS version
Installed hot fixes
List of stopped services#>

#Get-CimClass -Namespace root/CIMV2 | Where-Object CimClassName -like Win32* | Select-Object CimClassName | Where-Object {$_.CimClassName -match 'memory'} | Format-Wide
#Get-CimClass -ClassName win32_process | Select-Object -ExpandProperty CimClassMethods
#Get-CimClass -ClassName win32_process | Select-Object -ExpandProperty CimClassProperties

#$Obj = Get-CimInstance -ClassName win32_process -ComputerName localhost | Where-Object {$_.ProcessId -like '2176'}
#$Obj | Invoke-CimMethod -MethodName Terminate

$Obj = Get-CimInstance -ClassName win32_processor -ComputerName localhost
$Obj | Select Name, MaxClockSpeed | Format-List

$Obj = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName localhost
$Obj | Select @{label="FreePhysicalMemory(MB)"; expression={$_.FreePhysicalMemory/1024}}, `
    @{label="TotalVisibleMemorySize(MB)"; expression={$_.TotalVisibleMemorySize/1024}} `
        | Format-List
$Obj | Select Caption, Version | Format-List

$Obj = Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName localhost
$Obj | Select @{label="Total(GB)"; expression={$_.size/1gb}}, `
    @{label="FreeSpace(GB)"; expression={$_.freespace/1gb}}, DeviceID, DriveType `
    | Format-Table

$Obj = Get-CimInstance -ClassName Win32_QuickFixEngineering -ComputerName localhost
foreach ($HF in $Obj) {
    $HF | Select Description, HotFixID, InstallDate | Format-List
}

$Obj = Get-CimInstance -ClassName Win32_Service -ComputerName localhost
$Obj | Where-Object {$_.State -match 'stop'}

<#Task2.     Write a script to get all interactive and remote logon sessions 
for the selected remote computer. And for every session find associated user information.#>

$Obj = Get-CimInstance -ClassName Win32_Session -ComputerName localhost
$Obj | Format-Table
$Obj = Get-CimInstance -ClassName Win32_LoggedOnUser -ComputerName localhost
$Obj | Format-Table
 