#!/bin/bash
echo $*
for ARG in $*; do
    SUM=$(( $SUM + $ARG ))
done
echo SUM: $SUM
echo Args number: $#
echo Avg: $(( $SUM / $#))