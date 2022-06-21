<#Task2. Write an advanced function to delete file from a specific folder if file size greater then specified size in Kb.#> 

function Del-Files { 

[CmdletBinding()] 

param ( 

[Parameter(Mandatory)] 

[string]$InputPath, 

[Parameter(Mandatory)] 

[int]$InputSize #Mb 

) 

begin { 

Write-Verbose "Start checkin files more than $InputSize in dir $InputPath" 

} 

process { 

Get-ChildItem -Path $InputPath.ToString() -File | Where-Object {$_.Size -ge $InputSize*1mb} | Remove-Item -Verbose 

} 

end { 

Write-Verbose "Finish checkin files more than $InputSize in dir $InputPath"  

} 

} 

Del-Files ./Code/Module16 1 -Verbose 