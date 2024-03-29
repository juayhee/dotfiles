#!/bin/bash

platform=$(uname)
# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

# Install brew just in case it isn't there yet
# Apparently it installs in different places on mac depending on architecture...
if [ $platform = "Darwin" ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v apt > /dev/null
then
    echo "Package manager detected: apt"
    source "${dir}"/scripts/apt.sh

elif command -v yum > /dev/null
then
    echo "Package manager detected: yum"
    source "${dir}"/scripts/yum.sh

elif command -v brew > /dev/null
then
    echo "Package manager detected: brew"
    source "${dir}"/scripts/brew.sh

else
    echo "!! Could not detect package manager"
    exit 1
fi
