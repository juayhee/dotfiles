#!/bin/bash

# Darwin, Linux
platform=$(uname)

# Install brew just in case it isn't there yet
# Apparently it installs in different places on mac depending on architecture...
if [[ $platform == "Darwin"  ]]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v apt > /dev/null
then
    echo -e "${BLUE}Package manager detected: apt${RESET}"
    "${config_dir}"/scripts/apt.sh

elif command -v yum > /dev/null
then
    echo -e "${BLUE}Package manager detected: yum${RESET}"
    "${config_dir}"/scripts/yum.sh

elif command -v brew > /dev/null
then
    echo -e "${BLUE}Package manager detected: brew${RESET}"
    "${config_dir}"/scripts/brew.sh

else
    echo -e "${RED}Could not detect package manager${RESET}"
    exit 1
fi
