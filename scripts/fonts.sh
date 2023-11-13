#!/bin/bash
platform=$(uname)

## Unzip and move font files into ~/.local/share/fonts
echo "> Extracting files..."
unzip -o "${config_dir}"/fonts/JetBrainsMono.zip -d "${config_dir}"/tmp > /dev/null

# Reload font cache
echo "> Refreshing font cache..."
if [[ $platform == "Linux" ]]
then
    echo "> Copying to ~/.local/share/fonts"
    mkdir -p ~/.fonts
    cp -r "${config_dir}"/tmp ~/.local/share/fonts
    fc-cache -frv > /dev/null 2>&1

    if [[ $? -ne 0 ]]
    then
        echo -e "${RED}Could not install fonts${RESET}"
        exit 1
    fi
elif [[ $platform == "Darwin" ]]
then
    cp -r "${config_dir}"/tmp ~/Library/Fonts
fi

# Clean up
rm -r "${config_dir}"/tmp
