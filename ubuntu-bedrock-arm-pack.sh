#! /bin/sh
# Requires bedrock server url as parameter
# Official Minecraft Bedrock Server Page: https://www.minecraft.net/en-us/download/server/bedrock
# example: wget -qO - https://raw.githubusercontent.com/Ruhminations/nix-scripts/main/ubuntu-bedrock-arm-pack.sh | bash -s "https://minecraft.azureedge.net/bin-linux/bedrock-server-1.18.1.02.zip"

zip --help 2>&1 >/dev/null || { echo "[error] please install zip" && exit 1 }
curl --help 2>&1 >/dev/null || { echo "[error] please install curl" && exit 1 }
ldd --help 2>&1 >/dev/null || { echo "[error] please install ldd" && exit 1 }
grep --help 2>&1 >/dev/null || { echo "[error] please install grep" && exit 1 }
awk --help 2>&1 >/dev/null || { echo "[error] please install awk" && exit 1 }
xargs --help 2>&1 >/dev/null || { echo "[error] please install xargs" && exit 1 }

mkdir bedrock || { echo "[error] bedrock folder already exists." && exit 3 }
pushd bedrock
wget -O bedrock-server.zip $1 || { echo "[error] failed to download the bedrock server zip; please verify the url." && exit 4 }
unzip -o bedrock-server.zip || { echo "[error] zip downloaded failed to extract, please validate the url's file." && exit 5 }
file bedrock_server
ldd bedrock_server || { echo "[error] binary executable not recognized. OS architecture must match output above to run this script." && exit 6 }
mkdir depends
ldd bedrock_server | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -Lv '{}' depends
pushd depends
cp -Lv /lib64/* ./
zip -r bedrock_only_depends.zip *
mv * ../
popd
rm -r depends
curl --upload-file bedrock_only_depends.zip https://transfer.sh/bedrock_only_depends.zip || { echo "[error] failed to upload; you will have to move it manually." && exit 8 }
rm bedrock_only_depends.zip
popd
rm -r bedrock
