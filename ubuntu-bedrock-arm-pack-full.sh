#! /bin/sh
# docker run --rm -it -u root ubuntu:20.04 /bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install zip unzip wget curl gawk
wget -qO - https://raw.githubusercontent.com/Ruhminations/nix-scripts/main/ubuntu-bedrock-arm-pack.sh | bash -s "https://minecraft.azureedge.net/bin-linux/bedrock-server-1.18.2.03.zip"
