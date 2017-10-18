#! /bin/bash

ssh root@114.55.142.227 -l root 'cd /home/www/api.fourleaver.com && git pull && ./lb migrate/up'

if [ $? -eq 0 ]; then
    echo 'Build succeed'
else
    echo 'Build failed'
fi

