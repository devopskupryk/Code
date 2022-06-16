if (( ${#1} %2 == 0 )); then
    echo \"$1\" "has" ${#1} "letters - odd"
else
    echo \"$1\" "has" ${#1} "letters - even"
fi