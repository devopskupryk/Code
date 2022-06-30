<#Task2. Create a function that will get any array from the pipeline.  

Function output should be formatted according to the example below#> 

function Get-ValueFromPipe { 

begin{Write-Host Begin} 

process{Write-Host Value from pipe: $_ -ForegroundColor Yellow} 

end{Write-Host End} 

} 

1..3 | Get-ValueFromPipe 

@("First", "Second") | Get-ValueFromPipe 