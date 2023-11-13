#!/bin/bash

## Installs Zellij

# Check OS
platform=$(uname)

echo "> Downloading Zellij..."
# Work in tmp
mkdir -p ${config_dir}/tmp
cd ${config_dir}/tmp

if [[ $platform == "Linux" ]]
then
    echo "> Downloading for Linux"
    curl -LO https://github.com/zellij-org/zellij/releases/download/v0.39.0/zellij-x86_64-unknown-linux-musl.tar.gz
    if [[ $? -ne 0 ]]
    then
        echo -e "${RED}Failed to download${RESET}"
        exit 1
    fi
else	
    echo "> Downloading for macOS"
    curl -LO https://github.com/zellij-org/zellij/releases/download/v0.39.0/zellij-aarch64-apple-darwin.tar.gz
    if [[ $? -ne 0 ]]
    then
        echo -e "${RED}Failed to download${RESET}"
        exit 1
    fi
fi

echo "> Unpacking Zellij..."
tar -xvf ${config_dir}/tmp/zellij*.tar.gz > /dev/null

# Move to ~/.local/bin
echo "> Installing..."
cp -f ${config_dir}/tmp/zellij ~/.local/bin

# Clean up
rm -r ${config_dir}/tmp
