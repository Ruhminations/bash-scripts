#! /bin/sh
# wget -qO - https://github.com/Ruhminations/nix-scripts/raw/main/oracle-cloud-ubuntu-arm-bedrock-setup.sh | bash -s "https://minecraft.azureedge.net/bin-linux/bedrock-server-1.18.2.03.zip" "https://transfer.sh/get/XRLrIs/bedrock_only_depends.zip"


wget -qO - https://raw.githubusercontent.com/Ruhminations/nix-scripts/main/ubuntu-bedrock-arm-pack.sh | bash -s "https://github.com/Ruhminations/nix-scripts/raw/main/ubuntu-arm-x86-init.sh"
mkdir bedrock || { echo "[error] bedrock folder already exists." && exit 3; }
cd bedrock
wget -O bedrock-server.zip $1 || { echo "[error] failed to download the bedrock server zip; please verify the url." && exit 4; }
unzip -o bedrock-server.zip || { echo "[error] zip downloaded failed to extract, please validate the url's file." && exit 5; }
wget -O bedrock-depends.zip $2 || { echo "[error] failed to download the bedrock depends zip; please verify the url." && exit 6; }
unzip -o bedrock-depends.zip || { echo "[error] zip downloaded failed to extract, please validate the url's file." && exit 7; }
wget -O ubuntu-bedrock-start.sh "https://github.com/Ruhminations/nix-scripts/raw/main/ubuntu-bedrock-start.sh" || { echo "[error] failed to download the bedrock start script; please verify the url." && exit 8; }
sudo mkdir /mnt/bedrock
sudo mount -t tmpfs -o rw,size=2G tmpfs /mnt/bedrock
cp -r ./ /mnt/bedrock
cd /mnt/bedrock
ls
echo "ready to run '/mnt/bedrock/ubuntu-bedrock-start.sh'"
