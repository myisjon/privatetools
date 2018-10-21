#!/bin/bash

IS_P=0


for p in $(pip list|awk '{print $1}') ; do

    if [[ "$IS_P" == "0" ]] ; then
        echo $p | grep '^----'

        if [[ "$?" == "0" ]] ; then
            IS_P=1
            echo "start update pip packge"
            echo "------------------------------"
        fi
    else
        echo pip install -U $p
        pip install -U $p
    fi
done
