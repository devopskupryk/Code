$PASS = Read-Host -AsSecureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PASS)
$PASS = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
$query = @"
SELECT [physical_memory_in_use_kb]
FROM [sys].[dm_os_process_memory]
"@
Invoke-Sqlcmd -ServerInstance 10.0.2.10 -Username sa -Password $PASS -Query $query