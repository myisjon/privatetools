#!/bin/bash

BASH_PATH=$PWD

for dir in $(ls -l $PDW|awk '/^dr/''{print $NF}') ; do
    echo "open $dir"
    cd $dir
    echo "git pull --all"
    git pull --all
    cd -
done
