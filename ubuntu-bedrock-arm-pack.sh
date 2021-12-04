#! /bin/sh
# Requires bedrock server url as parameter
# Official Minecraft Bedrock Server Page: https://www.minecraft.net/en-us/download/server/bedrock
# example: wget -qO - https://raw.githubusercontent.com/Ruhminations/nix-scripts/main/ubuntu-bedrock-arm-pack.sh | bash -s "https://minecraft.azureedge.net/bin-linux/bedrock-server-1.18.1.02.zip"

zip --help 2>/dev/null || echo "[error] zip required"
curl --help 2>/dev/null || echo "[error] curl required"
mkdir bedrock || echo "[error] bedrock folder already exists."
pushd bedrock
wget -O bedrock-server.zip $1
unzip -o bedrock-server.zip
file bedrock_server
ldd bedrock_server || echo "[error] binary executable not recognized. OS architecture must match output above to run this script."
mkdir depends
ldd bedrock_server | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -Lv '{}' depends
pushd depends
cp -Lv /lib64/* ./
zip -r bedrock_only_depends.zip *
mv * ../
popd
rm -r depends
curl --upload-file bedrock_only_depends.zip https://transfer.sh/bedrock_only_depends.zip
rm bedrock_only_depends.zip
popd
rm -r bedrock
