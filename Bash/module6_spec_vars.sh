#!/bin/bash
echo $0
echo $#
for arg in "$*";
do
    echo $arg;
done
echo $2 $4
[[ $1 -eq $2 ]]
echo $?