#!/usr/bin/env bash

#Compulsory argument
if [ "$#" == "0" ]; then
    echo "please enter a CMTP name">>cmtp.log
    exit 1
else
    echo $1
fi

#finding directory
direc="$(find . -type d -name "$1")"


if [ -d "$direc" ]; then
    read -ep "Are you sure you want to delete the CMTP? (Y/N) " -i "N" YN

    if [ "$YN" == "N" ] || [ "$#" == "0" ]; then
        exit 1
    elif [ "$YN" = "Y" ]; then
        echo "Deleting "$direc"" >> cmtp.log
        rm -rf "$direc"
    else
        echo "Please enter 'Y' or 'N'"
    fi

else
        echo "CMTP does not exist" >> cmtp.log
        exit 1

fi
