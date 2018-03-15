#! /bin/bash

ssh root@59.110.168.173 -l root 'cd /root/blockchain && git pull && supervisorctl restart blockchain'

if [ $? -eq 0 ]; then
    echo 'Build succeed'
else
    echo 'Build failed'
fi
