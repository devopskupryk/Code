param (
    [Parameter(Mandatory=$true)]
    [String]$csv_path 
    )
#checking if the file exists:
if (-not(Test-Path $csv_path -PathType Leaf)) {
    Write-Host "Provide correct path to accounts.csv file. File $csv_path doesn't exist"
    exit 1
}

$ACCOUNTS = Import-Csv $csv_path #read csv file to array

for ($i=0; $i -lt $ACCOUNTS.Length; $i++){
    $Name=$($ACCOUNTS[$i].name -split " ")[0].substring(0,1).toupper()+$($ACCOUNTS[$i].name -split " ")[0].substring(1) #getting the name and setting first letter of the name uppercase
    $Surname=$($ACCOUNTS[$i].name -split " ")[1].substring(0,1).toupper()+$($ACCOUNTS[$i].name -split " ")[1].substring(1) #getting the name and setting first letter of the name uppercase
    $ACCOUNTS[$i].name=$Name+" "+$Surname #making correct "name" field
    $ACCOUNTS[$i].email=$Name.substring(0,1).tolower()+$Surname.tolower() #making email (without domain)
}

#comparing each email to each other:
for ($i=0; $i -lt $ACCOUNTS.Length; $i++) {
    for ($j=($i+1); $j -lt $ACCOUNTS.Length; $j++) {
        if ($ACCOUNTS[$i].email -like $ACCOUNTS[$j].email) {
            $MUSTEDIT=$true
            $ACCOUNTS[$j].email=$ACCOUNTS[$j].email+$ACCOUNTS[$j].location_id #if equal then adding local_id
        }
    }
    if ($MUSTEDIT) {
        $ACCOUNTS[$i].email=$ACCOUNTS[$i].email+$ACCOUNTS[$i].location_id #if must be edited then adding local_id
        $MUSTEDIT=$false
    }
    $ACCOUNTS[$i].email=$ACCOUNTS[$i].email+"@abc.com"
}

$ACCOUNTS | Export-Csv -Path $((Get-Item $csv_path).Parent+"accounts_new.csv") -NoTypeInformation