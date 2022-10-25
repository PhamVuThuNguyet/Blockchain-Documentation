#!/bin/bash
# Overwrites the config files
VER=0

if [ -n "$1" ]; then
    VER=$1
fi


ORIGIN=crypto
SRC=$PWD/../setup/config/simple-two-org/$ORIGIN.$VER

echo $SRC

if [ ! -d $SRC ]; then
    echo "Version $ORIGIN.$VER not found under config!!!"
    exit
fi

cp $SRC/*.yaml $PWD/simple-two-org

echo "Done."