#! /bin/sh

screen -X -S bedrock stuff "^C" || echo "[warning] no existing session to close"
screen -X -S bedrock quit || echo "[warning] no existing session to close"
mkdir ./bedrock_bakup || echo "[warning] backup directory already exists"
cp -r /mnt/bedrock ./bedrock_backup || echo "[warning] no existing files to backup"
sudo umount /mnt/bedrock || sudo lsof -n /mnt/bedrock || echo "[warning] no existing mount or unable to unmount"
sudo rm -rf /mnt/bedrock || echo "[warning] failed to cleanup files"

# if [ -z "$STY" ]; then
#   # TODO pull ports from properties
#   sudo iptables -L | grep 'ACCEPT.*udp.*19132' || sudo iptables -A INPUT -p udp --dport 19132 -j ACCEPT
#   sudo iptables -L | grep 'ACCEPT.*udp.*19133' || sudo iptables -A INPUT -p udp --dport 19133 -j ACCEPT

#   sudo mkdir /mnt/bedrock
#   sudo mount -t tmpfs -o rw,size=2G tmpfs /mnt/bedrock
#   cp -r ./ /mnt/bedrock
#   pushd /mnt/bedrock

#   if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
#     sudo rm /lib64/ld-linux-x86-64.so.2
#   fi
#   if [ -f ld-linux-x86-64.so.2 ]; then
#     sudo ln -s ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
#   fi
#   exec screen -L -Logfile bedrock.log -dmS bedrock sh $0;
# else
#   pushd /mnt/bedrock
#   LD_LIBRARY_PATH=. ./bedrock_server
# fi
