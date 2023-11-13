#!/bin/bash

## To .config
# Kitty
rm -rf ~/.config/kitty 2>/dev/null
ln -sf "${config_dir}/config/kitty" ~/.config/kitty || exit 1
echo "> kitty"

# Zellij
rm -rf ~/.config/zellij 2>/dev/null
ln -sf "${config_dir}/config/zellij" ~/.config/zellij || exit 1
echo "> zellij"

# NeoVim
rm -rf ~/.config/nvim 2>/dev/null
ln -sf  "${config_dir}/config/nvim" ~/.config/nvim || exit 1
echo "> NeoVim config"

## To $HOME
# .bashrc
rm ~/.bashrc 2>/dev/null
ln -sf "${config_dir}/config/.bashrc" ~/  || exit 1
echo "> .bashrc"

rm ~/.gitignore 2>/dev/null
ln -sf "${config_dir}/config/.gitignore" ~/ || exit 1
echo "> .gitignore"

