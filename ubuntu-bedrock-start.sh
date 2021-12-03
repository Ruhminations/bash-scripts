#! /bin/sh
if [ -z "$STY" ]; then exec screen -L -Logfile bedrock.log -dmS bedrock sh $0; fi
if [ ! -f /lib64/ld-linux-x86-64.so.2 ] && [ -f ld-linux-x86-64.so.2 ]; then
  sudo ln -s ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
else
  echo "[info] ld-linux-x86-64.so.2 mapping skipped."
fi
LD_LIBRARY_PATH=. ./bedrock_server
