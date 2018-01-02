#! /bin/bash

ssh root@10.28.231.170 -l root 'releaseId=luoxj-blog-release/luoxj-blog-release-`date +%Y%m%d%H%M%s` && cp -r ~/luoxj-blog ~/$releaseId && cd ~/$releaseId && git pull && npm install && npm run build && rm -rf ~/luoxj-blog && cp -r ~/$releaseId ~/luoxj-blog && supervisorctl restart luoxj-blog'

if [ $? -eq 0 ]; then
    echo 'Build succeed'
else
    echo 'Build failed'
fi

ssh root@10.81.74.11 -l root 'releaseId=luoxj-blog-release/luoxj-blog-release-`date +%Y%m%d%H%M%s` && cp -r ~/luoxj-blog ~/$releaseId && cd ~/$releaseId && git pull && npm install && npm run build && rm -rf ~/luoxj-blog && cp -r ~/$releaseId ~/luoxj-blog && supervisorctl restart luoxj-blog'

if [ $? -eq 0 ]; then
    echo 'Build succeed'
else
    echo 'Build failed'
fi
