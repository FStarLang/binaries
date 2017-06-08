#!/usr/bin/env bash

Z3_BIN_DIR=z3

Z3_SAFE_RELEASE=4.5.0
Z3_LATEST=$Z3_SAFE_RELEASE

if [[ $(uname) == "Darwin" ]]; then
    OS="osx"
    BITNESS="x64"
elif [[ $OS == "Windows_NT" ]]; then
    OS="win"
    BITNESS="x86"
elif [[ $(uname) == "Linux" ]]; then
    LSBD=$(lsb_release -d | cut -f 2 | cut -d ' ' -f 1,2,3 | cut -d '.' -f 1)
    case $LSBD in 
        "Ubuntu 14" | "Ubuntu 16") OS="ubuntu-14.04";;
        "Debian GNU/Linux 8") OS="debian-8.5";;
        *) echo "Unknown Linux system, assuming Ubuntu 14.*" && OS="ubuntu-14.04";;
    esac
    if [[ $(uname -m) == "x86_64" ]]; then
        BITNESS="x64"
    else
        BITNESS="x86"
    fi
else
    echo "Unknown platform."
    exit 1
fi

FILEPAT=z3-[[:digit:]].[[:digit:]].[[:digit:]].[[:alnum:]]+-$BITNESS-$OS.zip

mkdir -p $Z3_BIN_DIR
echo $FILEPAT

if [[ "z3-4.5.1.cfd598fabba7-x64-ubuntu-14.04.zip" =~ $FILEPAT ]]; then
    echo "match"
else
    echo "no match"
fi
