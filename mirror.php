<?php
//Copyright (c) 2017 Spot Communications, Inc.

$numMirrors = 0;

$file = noHTML($_GET["f"]);
$file = str_replace("&period;", ".", $file);
$file = str_replace("&sol;", "/", $file);
print($file);
if(!is_null($file) && substr_count($file, '.') == 2 && substr_count($file, '..') == 0 && substr_count($file, '/') == 1) {
	header('Location: ' . getMirror() . $file);
} else {
	print("Invalid request");
	http_response_code(400);
}

function getMirror() {
	if($GLOBALS['numMirrors'] == 0) {
		return "https://divestos.xyz/devices/";
	}
	return "https://mirror" . rand(0, $GLOBALS['numMirrors']) . ".divestosx.xyz/";
}

//Credit: https://paragonie.com/blog/2015/06/preventing-xss-vulnerabilities-in-php-everything-you-need-know
function noHTML($input, $encoding = 'UTF-8') {
    return htmlentities($input, ENT_QUOTES | ENT_HTML5, $encoding);
}
?>
