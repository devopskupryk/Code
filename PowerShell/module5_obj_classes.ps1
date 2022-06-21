class MyClass {
    [int]pow([int]$B,[int]$E) {
        return [math]::pow($B,$E)
    }
}
$Obj = New-Object MyClass
$Obj.pow(2,3)

class MyClass1 {
    [string]$Str
    [string]SetString([string]$StrIn){
        return $this.Str = $StrIn
    }
    [string]PrintString(){
        return $this.Str.ToUpper() 
    }
}
$Obj1 = New-Object MyClass1
$Obj1.SetString("Hello")
$Obj1.PrintString()

class MyClass2 {
    [string]Revers([string]$StrIn) {
        [array]$Arr = $StrIn.ToCharArray()
        [array]::Reverse($Arr)
        return -join($Arr)
    }
}
$Obj2 = New-Object MyClass2
$Obj2.Revers("Hello")