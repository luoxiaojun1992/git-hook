#! /bin/bash

ssh root@10.28.231.170 -l root 'cd /home/www/sf.fourleaver.com && git pull && ./lb migrate/up && composer install -vvv'

if [ $? -eq 0 ]; then
    echo 'Build succeed'
else
    echo 'Build failed'
fi

ssh root@10.81.74.11 -l root 'cd /home/www/sf.fourleaver.com && git pull && ./lb migrate/up && composer install -vvv'

if [ $? -eq 0 ]; then
    echo 'Build succeed'
else
    echo 'Build failed'
fi
