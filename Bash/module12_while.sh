#!/bin/bash 
while [[ $COMMAND != "exit" ]]; do
    read COMMAND
    case `echo ${COMMAND} | awk '{print $1}'` in
        ls) $(echo $COMMAND | sed -e "s/\~/\/home\/$(whoami)/g") ;;
        pwd) pwd;;
        hi) echo "Hello" $(whoami);;
        exit);;
        *) echo "Wrong command. Use [ls <path>|pwd|hi|exit]"
    esac
done