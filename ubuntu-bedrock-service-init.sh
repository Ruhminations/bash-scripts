#! /bin/sh

if [ -d /mnt/bedrock ]; then
  echo "[error] mount point already exists, please cleanup any existing setup first."
  exit 1;
fi

sudo mkdir /mnt/bedrock
echo 'tmpfs  /mnt/bedrock  tmpfs  rw,size=2G  0   0' | sudo tee -a /etc/fstab

cp -r ./ /mnt/bedrock
pushd /mnt/bedrock

