<?php
//Copyright (c) 2017 Spot Communications, Inc.

error_reporting(E_ERROR | E_PARSE);

$numMirrors = 0;

$build = noHTML($_GET["b"]);
$build = str_replace("&period;", ".", $build);
$file = noHTML($_GET["f"]);
$file = str_replace("&period;", ".", $file);
$file = str_replace("&sol;", "/", $file);
if(!is_null($build) && substr_count($build, '.') <= 1 && substr_count($build, '/') == 0 && !is_null($file) && substr_count($file, '.') == 2 && substr_count($file, '..') == 0 && substr_count($file, '/') <= 2) {
	header('Location: ' . getMirror() . $build . "/" . $file);
} else {
	print("Invalid request");
	http_response_code(400);
}

function getMirror() {
	if($GLOBALS['numMirrors'] == 0) {
		return "https://divestos.xyz/builds/";
	}
	return "https://mirror" . rand(0, $GLOBALS['numMirrors']) . ".divestos.xyz/";
}

//Credit: https://paragonie.com/blog/2015/06/preventing-xss-vulnerabilities-in-php-everything-you-need-know
function noHTML($input, $encoding = 'UTF-8') {
    return htmlentities($input, ENT_QUOTES | ENT_HTML5, $encoding);
}
?>
