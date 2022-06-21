<#Task1. Create a function that will get a string and one of several switch parameters  

and return the text from string with the color passed with switch parameter.#> 

function Write-ColorText { 

param ( 

[string]$InputStr = "No string entered!", 

[switch]$Blue, 

[switch]$Red 

) 

if ($Blue) { 

Write-Host $InputStr -ForegroundColor Blue 

} 

if ($Red) { 

Write-Host $InputStr -ForegroundColor Red 

} 

} 

Write-ColorText -InputStr Hello -Blue 

Write-ColorText -InputStr Hello -Red 