#! /bin/sh
# example:

#TODO create stop script to use screen
#if [ -z "$STY" ]; then exec screen -L -Logfile bedrock.log -dmS bedrock sh $0; fi

sudo mkdir /mnt/bedrock
sudo mount -t tmpfs -o rw,size=2G tmpfs /mnt/bedrock
cp -r ./ /mnt/bedrock
pushd /mnt/bedrock

if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
  sudo rm /lib64/ld-linux-x86-64.so.2
fi
if [ -f ld-linux-x86-64.so.2 ]; then
  sudo ln -s ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
fi

LD_LIBRARY_PATH=. ./bedrock_server
