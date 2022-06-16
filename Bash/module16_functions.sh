#!/bin/bash
function second () {
    ARG=$(($1**2))
}
function first () {
    for ARG in $*; do
        second $ARG
        echo $(($ARG+1))
    done
}
first $*