#! /bin/bash

if [ -z "$STY" ]; then
  # TODO pull ports from properties
  sudo iptables -L | grep 'ACCEPT.*udp.*19132' || sudo iptables -A INPUT -p udp --dport 19132 -j ACCEPT
  sudo iptables -L | grep 'ACCEPT.*udp.*19133' || sudo iptables -A INPUT -p udp --dport 19133 -j ACCEPT

  sudo rm /lib64/ld-linux-x86-64.so.2 || echo "no existing symlink"
  if [ -f ld-linux-x86-64.so.2 ]; then
    sudo ln -s ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
  fi

  sudo mkdir /mnt/bedrock
  sudo mount -t tmpfs -o rw,size=4G tmpfs /mnt/bedrock
  cp -r ./ /mnt/bedrock
  cd /mnt/bedrock

  echo starting
  exec screen -L -Logfile bedrock.log -dmS bedrock sh $0
else
  echo hello
  cd /mnt/bedrock
  LD_LIBRARY_PATH=. ./bedrock_server
fi
