#! /bin/bash

ssh root@10.28.231.170 -l root 'cd /home/www/git-hook.fourleaver.com && git pull'

if [ $? -eq 0 ]; then
    echo 'Build succeed'
else
    echo 'Build failed'
fi

ssh root@10.81.74.11 -l root 'cd /home/www/git-hook.fourleaver.com && git pull'

if [ $? -eq 0 ]; then
    echo 'Build succeed'
else
    echo 'Build failed'
fi
