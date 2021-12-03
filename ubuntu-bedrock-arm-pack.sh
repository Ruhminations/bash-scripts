#! /bin/sh
# Requires bedrock server url as parameter

mkdir bedrock || echo "[error] bedrock folder already exists."
cd bedrock
wget -O bedrock-server.zip $1
unzip -o bedrock-server.zip
file bedrock_server
ldd bedrock_server || echo "[error] binary executable not recognized. OS architecture must match output above to run this script."
mkdir depends
ldd bedrock_server | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -Lv '{}' depends
cd depends
cp -Lv /lib64/* ./
cd ..
zip -r depends.zip depends
mv depends/* ./
mv depends.zip ../bedrock_only_depends.zip
echo "bedrock_only_depends.zip creation complete"
# TODO download start script
# TODO package bedrock with depends
cd ..
rm -r bedrock
