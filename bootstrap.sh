#!/bin/bash
export BLUE="\e[0;34m"
export RED="\e[0;31m"
export RESET="\e[0m"
export config_dir=$(cd "$(dirname $BASH_SOURCE)" && pwd) # Config root

# Create necessary directories
echo -e "${BLUE}Creating ~/.config and ~/.local...${RESET}"
mkdir -p ~/.config
mkdir -p ~/.local

## Setup
# Dotfiles
echo -e  "${BLUE}Setting up dotfiles...${RESET}"
echo -e  "${BLUE}Creating symlinks...${RESET}"
"${config_dir}"/scripts/symlinker.sh
if [[ $? -ne 0 ]];
then
    echo -e "${RED}Symlinks could not be set up${RESET}"
    exit 1
fi

# System dependencies
echo -e "${BLUE}Installing system dependencies...${RESET}"
source "${config_dir}"/scripts/dependencies.sh
if [[ $? -ne 0 ]]
then
    echo -e "${RED}Failed to install dependencies${RESET}"
    exit 1
fi

# Source .bashrc for new environment variables
source ~/.bashrc

## Applications
echo -e "${BLUE}Installing NeoVim...${RESET}"

#  NeoVim
"${config_dir}"/scripts/neovim.sh
if [[ $? -ne 0 ]]
then
    echo -e "${RED}NeoVim could not be installed${RESET}"
    exit 1
fi


# Zellij
echo -e "${BLUE}Installing Zellij...${RESET}"
echo "> Installing Zellij..."
"${config_dir}"/scripts/zellij.sh
if [[ $? -ne 0 ]]
then
    echo -e "${RED}Zellij could not be installed${RESET}"
    exit 1
fi

# # Kitty
# echo "> Installing Kitty..."
# source "${config_dir}"/scripts/kitty.sh

# Fonts
echo -e "${BLUE}Unpacking fonts...${RESET}"
"${config_dir}"/scripts/fonts.sh
if [[ $? -ne 0 ]]
then
    echo -e "${RED}Fonts could not be installed${RESET}"
    exit 1
fi

cd $config_dir # Return to root of dotfiles directory first, since cwd may not exist
echo -e "${BLUE}Bootstrapping complete${RESET}"
