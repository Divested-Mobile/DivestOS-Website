<?php

error_reporting(E_ERROR | E_PARSE);

//START OF PAGE LOADER
$page = noHTML($_GET["page"]);
if(strlen($page) == 0) {
	$page = "home";
}
if(strpos($page, '&period;') === false && strpos($page, '&sol;') === false) {
	$page = str_replace("&lowbar;", "_", $page);
	$page = "pages/" . $page . ".html";
	if(file_exists($page)) {
		$pageReal = $page;
	} else {
		$pageContents = genErrorPage(404);
	}
} else {
	$pageContents = genErrorPage(400);
}
//END OF PAGE LOADER


//START OF PAGE
include "fragments/header.html";
if(isset($pageReal)) {
	include $pageReal;
} else {
	print($pageContents);
}
include "fragments/footer.html";
//END OF PAGE


//START OF FUNCTIONS
function genErrorPage($errorCode) {
	http_response_code($errorCode);
	return str_replace("ERROR_PLACEHOLDER", $errorCode, file_get_contents("fragments/error.html"));
}

//Credit: https://paragonie.com/blog/2015/06/preventing-xss-vulnerabilities-in-php-everything-you-need-know
function noHTML($input, $encoding = 'UTF-8') {
	return htmlentities($input, ENT_QUOTES | ENT_HTML5, $encoding);
}

//Credit: https://stackoverflow.com/a/7112596
function contains($haystack, $needle) {
	return strpos($haystack, $needle) !== false;
}
//END OF FUNCTIONS

?>
