<?php
//Copyright (c) 2017 Divested Computing, Inc.
//
//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <https://www.gnu.org/licenses/>.

error_reporting(E_ERROR | E_PARSE);

$numMirrors = 0;

$base = noHTML($_GET["base"]);
$base = str_replace("&period;", ".", $base);
$file = noHTML($_GET["f"]);
$file = str_replace("&period;", ".", $file);
$file = str_replace("&sol;", "/", $file);
if(!is_null($base) && strlen($base) > 0 && substr_count($base, '.') <= 1 && substr_count($base, '/') == 0 && !is_null($file) && strlen($file) > 0 && substr_count($file, '.') <= 2 && substr_count($file, '..') == 0 && substr_count($file, '/') <= 2) {
	header('Location: ' . getMirror() . $base . "/" . $file);
} else {
	print("Invalid request");
	http_response_code(400);
}

function getMirror() {
	if($GLOBALS['numMirrors'] == 0) {
		return "https://" . $_SERVER['SERVER_NAME'] . "/builds/";
	}
	return "https://mirror" . rand(0, $GLOBALS['numMirrors']) . "." . $_SERVER['SERVER_NAME'] . "/";
}

//Credit: https://paragonie.com/blog/2015/06/preventing-xss-vulnerabilities-in-php-everything-you-need-know
function noHTML($input, $encoding = 'UTF-8') {
    return htmlentities($input, ENT_QUOTES | ENT_HTML5, $encoding);
}
?>
