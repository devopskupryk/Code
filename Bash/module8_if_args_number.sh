if [[ $# -lt 2 ]]; then
    echo "$@"
elif ( [[ $# -gt 2 ]] && [[ $# -lt 4 ]] ); then
    echo ${!#}
else
    echo Invalid number of arguments
fi 
