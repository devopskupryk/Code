#Task1
Write-Host "Start Task1"
Get-ChildItem -File `
| Select-Object -Property Name, Length, @{label="Size(MB)";expression={$_.Length/1024/1024/8}}
Write-Host "Finish Task1"
#Task2
function Sort-Bubble {
    [CmdletBinding()]
    param (
#        [Parameter(Mandatory = $true, Position = 0)]
        [array]$Array,
        [switch]$Descending
    )   
    $n = $Array.Count
    $order = if ($Descending) { 'Descending' } else { 'Ascending' }
    Write-Verbose "Start sorting $n elements in $order order"
    for($i = 1; $i -lt $n; $i++) {
        for($j = 0; $j -lt ($n - $i); $j++) {
            Write-Verbose "Comparing value $($Array[$j]) against value $($Array[$j + 1])"
            if ($Descending) {
                if ($Array[$j] -lt $Array[$j+1]) {
                    Write-Verbose "Swapping values$($Array[$j]) <--> $($Array[$j + 1])"
                    $Array[$j], $Array[$j + 1] = $Array[$j + 1], $Array[$j]
                }
            }
            else {
                if ($Array[$j] -gt $Array[$j + 1]) {
                    Write-Verbose "Swapping values $($Array[$j]) <--> $($Array[$j + 1])"
                    $Array[$j], $Array[$j + 1] = $Array[$j + 1], $Array[$j]
                }                
            }
        }
    }
    return $Array  
}

Write-Host Original Array: $args[0] -NoNewline; Write-Host

if ($args[1] -eq '-Descending') {
    if ($args[2] -eq '-Verbose') {
        $sorted = Sort-Bubble $args[0] -Descending -Verbose
    }
    else {
        $sorted = Sort-Bubble $args[0] -Descending
    }
}
elseif ($args[1] -eq '-Verbose') {
    $sorted = Sort-Bubble $args[0] -Verbose
}
else {
    $sorted = Sort-Bubble $args[0]
}
Write-Host "Sorted Array  :" $sorted
