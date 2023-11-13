#!/bin/bash

echo "> update"
sudo apt-get update -y > /dev/null 2>&1 || apt-get update -y > /dev/null

echo "> upgrade"
sudo apt-get upgrade -y > /dev/null 2>&1 || apt-get update -y > /dev/null 

echo "> install"
sudo apt-get install -y > /dev/null 2>&1 || apt-get install -y > /dev/null \
    build-essential \
    git \
    curl \
    ripgrep \
    unzip \
    fontconfig
