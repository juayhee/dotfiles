#!/bin/bash

root_dir=$(cd "$(dirname $BASH_SOURCE)" && pwd)

# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/.local

## Setup
# Dotfiles
echo ">> Setting up dotfiles..."
source "${root_dir}"/scripts/symlinker.sh

# System dependencies
echo ">> Installing system dependencies..."
source "${root_dir}"/scripts/dependencies.sh

# Source .bashrc
source ~/.bashrc

## Applications
echo ">> Installing applications..."

# #  NeoVim
# echo "> Installing NeoVim..."
# source "${root_dir}"/scripts/neovim.sh

cd $root_dir # Return to root of dotfiles directory first, since cwd may not exist
source ~/.bashrc
echo "== Bootstrapping complete ==" 

