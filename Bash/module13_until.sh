#!/bin/bash
read -p "Enter file name: " FILE``
head -c 4KB /dev/urandom > ~/homework/$FILE

until [ $(($(wc -c ~/homework/$FILE | awk '{print $1}') / 1000)) -gt 1024 ]; do
    cat ~/homework/$FILE > ~/homework/tmp.txt
    cat ~/homework/tmp.txt >> ~/homework/$FILE
    echo Filesize $(($(wc -c ~/homework/$FILE | awk '{print $1}') / 1000))
done

rm ~/homework/tmp.txt
rm ~/homework/$FILE