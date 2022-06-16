#!/bin/bash
if [[ "$1" = "$2" ]]; then
    echo First comparison code: $? $1 "=" $2
else
    echo First comparison code: $? $1 "!=" $2
fi

if [[ "$1" > "$2" ]]; then
    echo Second comparison code: $? $1 ">" $2
else
    echo Second comparison code: $? $1 "<=" $2
fi

if [[ -n $TEST ]]; then
    echo Therd comparison code: $? $TEST
else
    echo Second comparison code: $? $TEST
fi

if [[ $3 -ne $4 ]]; then
    echo Fourth comparison code: $? $3 "-ne" $4
else
    echo Fourth comparison code: $? $3 "-eq" $4
fi

if [[ $3 -ge $4 ]]; then
    echo Fourth comparison code: $? $3 "-ge" $4
else
    echo Fourth comparison code: $? $3 "-lt" $4
fi