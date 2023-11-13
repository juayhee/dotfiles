#!/bin/bash

platform=$(uname)

# Work in /tmp
mkdir -p ${config_dir}/tmp
cd ${config_dir}/tmp

echo "> Cloning NeoVim..."

if [[ $platform == "Linux" ]]
then
    echo "> Downloading for Linux"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    if [[ $? -ne 0 ]]
    then
        echo -e "${RED}Failed to download${RESET}"
        exit 1
    fi

    echo "> Extracting archive..."
    tar xvzf nvim-linux64.tar.gz > /dev/null
    cp -rf nvim-linux64/* ~/.local
elif [[ $platform == "Darwin" ]]
then
    echo "> Downloading for macOS"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz
    if [[ $? -ne 0 ]]
    then
        echo -e "${RED}Failed to download${RESET}"
        exit 1
    fi
    xattr -c ./nvim-macos.tar.gz # Avoid security check

    echo "> Extracting archive..."
    tar xvzf nvim-macos.tar.gz > /dev/null

    # For some reason running an nvim binary that overwrote
    # the previous binary results in 'Killed: 9'
    # Some kind of macOS security issue? So we remove the
    # old binary first
    rm -rf ~/.local/bin/nvim 
    cp -r nvim-macos/* ~/.local
else # Build from source
    echo "> Building from source"
    git clone https://github.com/neovim/neovim > /dev/null
    cd neovim
    git checkout stable > /dev/null
    make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=~/.local > /dev/null
    make install > /dev/null
fi

# Clean up
rm -r ${config_dir}/tmp
