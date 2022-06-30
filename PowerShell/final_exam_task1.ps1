[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [String]$ip_address_1, 
    [Parameter(Mandatory=$true)]
    [String]$ip_address_2,
    [Parameter(Mandatory=$true)] 
    [String]$network_mask
)
Write-Verbose "Got next params: $ip_address_1 $ip_address_2 $network_mask"
#$ip_invalid_pattern =   '^0\.|^255\.|\.0$|\.255$' #uncomment if want to exclude ip which start or finish with 0|255

$mask_valid_bytes = '0|128|192|224|240|248|252|254|255'
$mask_pattern = ('^((({0})\.0\.0\.0)|'      -f $mask_valid_bytes) +
                ('(255\.({0})\.0\.0)|'      -f $mask_valid_bytes) +
                ('(255\.255\.({0})\.0)|'    -f $mask_valid_bytes) +
                ('(255\.255\.255\.({0})))$' -f $mask_valid_bytes)

#Checking if the first ip is correct:
try {
    [ipaddress]$ip_address_1 = $ip_address_1
    <#uncomment if want to exclude ip which start or finish with 0|255
    if ($ip_address_1 -match $ip_invalid_pattern) {
        Write-Host "$ip_address_1 is wrong ip address"
        exit 1    
    }
    else {#>
        Write-Verbose "$ip_address_1 is correct ip address"    
    #}
}
catch {
    Write-Host "$ip_address_1 is wrong ip address"
    exit 1    
}
#Checking if the second ip is correct:
try {
    [ipaddress]$ip_address_2 = $ip_address_2
    <#uncomment if want to exclude ip which start or finish with 0|255
    if ($ip_address_2 -match $ip_invalid_pattern) {
        Write-Host "$ip_address_2 is wrong ip address"
        exit 1    
    }
    else {#>
        Write-Verbose "$ip_address_2 is correct ip address"    
    #}
}
catch {
    Write-Host "$ip_address_2 is wrong ip address"
    exit 1    
}
#Converting prefix to bytes (if suitable) and try to convert to ipaddres type:
if ($network_mask.Length -le 2) {
    try {
        if (($network_mask.ToInt16($Null) -le 32) -and (($network_mask.ToInt16($Null) -ge 0))) {
            $mask_in_prefix_format = ([Math]::Pow(2, $network_mask) - 1) * [Math]::Pow(2, (32 - $network_mask))
            $mask_in_bytes = [BitConverter]::GetBytes([UInt32] $mask_in_prefix_format)
            [ipaddress]$network_mask = (($mask_in_bytes.Count - 1)..0 | ForEach-Object { [String] $mask_in_bytes[$_] }) -join "." 
        }
        else {
            Write-Host "$network_mask is wrong subnet prefix"
            exit 1
        }        
    }
    catch {
        Write-Host "$network_mask is wrong subnet prefix"
        exit 1
    }
}
else {
    try {
        [ipaddress]$network_mask=$network_mask
    }
    catch {
        Write-Host "$network_mask is wrong subnet prefix"
        exit 1        
    }
}
#Cheking if mask is correct:
if ($network_mask -match $mask_pattern) {
    Write-Verbose "$network_mask is correct subnet mask"
}
else {
    Write-Host "$network_mask is wrong subnet mask"
    exit 1        
}
#Calculating and comparing the networks addresses of two ip:
if (($ip_address_1.address -band $network_mask.address) -eq ($ip_address_2.address -band $network_mask.address)) {Write-Host "yes"}
else {Write-Host "no"}

Write-Verbose "network address of first ip: $((0..(([BitConverter]::GetBytes([UInt32] ($ip_address_1.address -band $network_mask.address))).Count - 1) `
| ForEach-Object { [String] ([BitConverter]::GetBytes([UInt32] ($ip_address_1.address -band $network_mask.address)))[$_] }) -join ".")"
Write-Verbose "network address of second ip: $((0..(([BitConverter]::GetBytes([UInt32] ($ip_address_2.address -band $network_mask.address))).Count - 1) `
| ForEach-Object { [String] ([BitConverter]::GetBytes([UInt32] ($ip_address_2.address -band $network_mask.address)))[$_] }) -join ".")"
