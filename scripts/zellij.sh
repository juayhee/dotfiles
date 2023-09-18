#!/bin/bash
set -euo pipefail

## Installs Zellij

# Absolute path to config root
dir=$(realpath "$(dirname "${BASH_SOURCE[0]}")/..")

echo ">> Downloading Zellij..."
# Work in tmp
mkdir -p ${dir}/tmp
cd ${dir}/tmp

curl -LO https://github.com/zellij-org/zellij/releases/download/v0.38.2/zellij-x86_64-unknown-linux-musl.tar.gz

echo ">> Unpacking Zellij..."
tar -xvf ${dir}/tmp/zellij*.tar.gz > /dev/null 2>&1

# Move to ~/.local/bin
echo ">> Installing..."
cp ${dir}/tmp/zellij ~/.local/bin

# Clean up
rm -r ${dir}/tmp

echo " == Zellij installed. ==" 



