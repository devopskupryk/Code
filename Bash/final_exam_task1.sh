#!/bin/bash

#checking if the argument has been provided:
[ $# -ne 1 ] && echo "Provide path to accouts.csv file as argument to this script. You've provided $# argument(s)!" && exit 1
#checking if the file exists:
[ ! -f $1 ] && echo "Provide correct path to accounts.csv file. File $1 doesn't exist!" && exit 1

ROWCOUNTER=0

#reading csv file line by line:
while read -r line
do
    LINE=`echo $line | sed "s/,\ /:/g"` # changing ", " to ":" for correct parsing by IFS "," 
    IFS=","
    read id local_id name title email department <<< $LINE #reading fields from line
    IFS=
    if [ $ROWCOUNTER -eq 0 ]; then
        echo $id,$local_id,$name,$title,$email,$department > $(dirname $1)/accounts_new.csv #writig a header to new file
    else
        NAME=$( echo $name | awk '{print $1}') #getting name from name field
        SURNAME=$( echo $name | awk '{print $2}') #getting surname from name field
        NAME=`echo ${NAME:0:1} | tr [:lower:] [:upper:]``echo ${NAME:1}` #setting first letter of name uppercase
        SURNAME=`echo ${SURNAME:0:1} | tr [:lower:] [:upper:]``echo ${SURNAME:1}` #setting first letter of surname uppercase
        #making rows array:
        Aid[$ROWCOUNTER]=$id
        Alocal_id[$ROWCOUNTER]=$local_id
        Aname[$ROWCOUNTER]="$NAME $SURNAME"
        Atitle[$ROWCOUNTER]=`echo $title | sed "s/:/,\ /g"` #returning ", " instead ":" 
        Aemail[$ROWCOUNTER]=`echo ${NAME:0:1} | tr [:upper:] [:lower:]``echo $SURNAME | tr [:upper:] [:lower:]` #making email (without domain) 
        Adepartment[$ROWCOUNTER]=$department
    fi
    ((ROWCOUNTER++))
done < $1

#comparing each email to each other:
for ((i=1;i<($ROWCOUNTER);i++)); do
    for ((j=($i+1);j<($ROWCOUNTER);j++)); do
        if [[ ${Aemail[$i]} = ${Aemail[$j]} ]]; then
            MUSTEDIT=1
            Aemail[$j]=${Aemail[$j]}${Alocal_id[$j]} #if equal then adding local_id
        fi
    done
    if [ $MUSTEDIT -eq 1 ]; then
        Aemail[$i]=${Aemail[$i]}${Alocal_id[$i]} #if must be edited then adding local_id
        MUSTEDIT=0 
    fi
    #appending correct row to the new file
    echo "${Aid[$i]},${Alocal_id[$i]},${Aname[$i]},${Atitle[$i]},${Aemail[$i]}@abc.com,${Adepartment[$i]}" >> $(dirname $1)/accounts_new.csv 
done