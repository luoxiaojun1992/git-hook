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
	if ($branch == PROD_BRANCH) {
		system('./build.sh > /dev/null 2>&1 &');
	}
}
