#! /bin/bash

ssh root@114.55.142.227 -l root 'cd /home/www/git-hook.fourleaver.com && git pull'

if [ $? -eq 0 ]; then
    echo 'Build succeed'
else
    echo 'Build failed'
fi

