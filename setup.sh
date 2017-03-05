#!/bin/bash -e

unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
    ./setup-fedora.sh
elif [[ "$unamestr" == 'Darwin' ]]; then
    ./setup-mac.sh
fi
