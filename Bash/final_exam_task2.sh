#!/bin/bash

#checking if the argument has been provided:
[ $# -ne 1 ] && echo "Provide path to output.txt file as argument to this script. You've provided $# argument(s)!" && exit 1
#checking if the file exists:
[ ! -f $1 ] && echo "Provide correct path to output.txt file. File $1 doesn't exist!" && exit 1

LINE_COUNTER=0
sed -i -e '$a\' $1 # adding newline symbol at the end of the file to correct reading the last line 

#reading output file line by line:
while read -r line
do
    Alines[$LINE_COUNTER]=$line
    ((LINE_COUNTER++))
done < $1

IFS=","
read testName null <<< ${Alines[0]} #reading testName from 1st line, other part sending to null var
testName=`echo $testName | sed "s/\[ //;s/\ \]//g"` #deleting "[ " and " ]"
IFS=

for ((i=2;i<($LINE_COUNTER-2);i++)); do
    duration[i-2]=$( echo ${Alines[$i]} | awk '{print $NF}' | sed "s/ms//g" ) #getting a duration of each test. 
    spend=$(( $spend + ${duration[i-2]} )) #calculating total time was spent for test. 
    #getting a status of each test:
    if [ $( echo ${Alines[$i]} | awk '{print $1}' ) = "ok" ]; then
        status[i-2]="true"
        name[i-2]=$( echo ${Alines[$i]} | awk '{for (a=3;a<NF;a++) name=name$a" "} END {print name}' | sed "s/.$//" | sed "s/.$//")
        ((success++))
    else
        status[i-2]="false"
        name[i-2]=$( echo ${Alines[$i]} | awk '{for (a=4;a<NF;a++) name=name$a" "} END {print name}' | sed "s/.$//" | sed "s/.$//")
        ((failed++))    
    fi
done

#Calculated total duration doesn't match specified in output.txt (132ms instead 136ms). 
#That isn't clear from the task discription if I must calculate total time or just take it from the last line
#Code for takig the total duration from the last line:
#spend=$( echo ${Alines[$LINE_COUNTER-1]} | awk '{print $NF}' | sed "s/ms//g" )

raiting=`printf %.2f $(echo "scale=10; $success*100/($success+$failed) ;" | bc -l)` #calculating a raiting

#creating output.json
echo "{" > $(dirname $1)/output.json
echo " ""\"testName\": \"$testName\"," >> $(dirname $1)/output.json
echo " ""\"tests\": [" >> $(dirname $1)/output.json
for ((i=2;i<($LINE_COUNTER-2);i++)); do #writing test results
    echo "  ""{" >> $(dirname $1)/output.json
    echo "   ""\"name\": \"${name[i-2]}\"," >> $(dirname $1)/output.json
    echo "   ""\"status\": ${status[i-2]}," >> $(dirname $1)/output.json
    echo "   ""\"duration\": \"${duration[i-2]}""ms\"" >> $(dirname $1)/output.json
    if [ $i -eq $(($LINE_COUNTER-3)) ]; then #checking if the last test (for adding\deleting ",")
        echo "  ""}" >> $(dirname $1)/output.json
    else
        echo "  ""}," >> $(dirname $1)/output.json
    fi
done
echo " ""]," >> $(dirname $1)/output.json
echo " ""\"summary\": {" >> $(dirname $1)/output.json
echo "  ""\"success\": $success," >> $(dirname $1)/output.json
echo "  ""\"failed\": $failed," >> $(dirname $1)/output.json
echo "  ""\"raiting\": $raiting," >> $(dirname $1)/output.json
echo "  ""\"duration\": \"$spend""ms\"" >> $(dirname $1)/output.json
echo " ""}" >> $(dirname $1)/output.json
echo "}" >> $(dirname $1)/output.json 