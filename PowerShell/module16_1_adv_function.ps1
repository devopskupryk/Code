<#Task1. Write an advanced function to show the size of files in specific folder and sort all of them by size.#> 

function Show-Files { 

[CmdletBinding()] 

param ( 

[Parameter(Mandatory)] 

[string]$InputPath 

) 

begin { 

Write-Verbose "Start reading dir $InputPath"  

} 

process { 

Get-ChildItem -Path $InputPath.ToString() -File | Sort-Object -Property Size 

} 

end { 

Write-Verbose "Finish reading dir $InputPath" 

} 

} 

Show-Files ./Code -Verbose 