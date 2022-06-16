#!/bin/bash
ARGs=($@)
for ((i=0;i<$#;i++)); do
    echo Arg$(($i + 1)): ${ARGs[i]}
    if ((i<$#-1)); then
        ARR="$ARR $((${ARGs[i]} + ${ARGs[i+1]}))"
    fi
done
ARR="$ARR $((${ARGs[i-1]} + ${ARGs[0]}))"
echo $ARR