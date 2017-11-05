<?php

define('PROD_BRANCH', 'master');

$secret = '3JsqJSHVTsx1uKqy';

$jsonData = file_get_contents('php://input');

if ($_SERVER['HTTP_X_HUB_SIGNATURE'] != ('sha1=' . hash_hmac('sha1', $jsonData, $secret))) {
	exit(1);
}

$data = json_decode($jsonData, true);
if ($data) {
	$ref = $data['ref'];
	$refArr = explode('/', $ref);
	$branch = $refArr[2];
	$project = $data['repository']['full_name'];
	if ($branch == PROD_BRANCH) {
		switch($project) {
			//博客
			case 'luoxiaojun1992/luoxj-blog':
				system('./deploy_scripts/build.sh > /dev/null 2>&1 &');
				break;
			//博客后台
			case 'luoxiaojun1992/luoxj-blog-backend':
				system('./deploy_scripts/luoxj_blog_backend_build.sh > /dev/null 2>&1 &');
				break;
			//服务框架
			case 'luoxiaojun1992/sf':
				system('./deploy_scripts/sf_build.sh > /dev/null 2>&1 &');
				break;
			//微服务
			case 'luoxiaojun1992/services':
				system('./deploy_scripts/services_build.sh > /dev/null 2>&1 &');
				break;
			//Git自动部署
			case 'luoxiaojun1992/git-hook':
				system('./deploy_scripts/git_hook_build.sh > /dev/null 2>&1 &');
				break;


		}
	}
}
