<?php
//Copyright (c) 2017-2020 Divested Computing Group
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

$handler = true;
include "sbnr/config.php";
include "sbnr/security.php";
include "sbnr/utils.php";
include "sbnr/pre.php";

$numMirrors = 0;

$base = noHTML($_GET["base"]);
$base = str_replace("&period;", ".", $base);
$file = noHTML($_GET["f"]);
$file = str_replace("&period;", ".", $file);
$file = str_replace("&sol;", "/", $file);
$file = str_replace("&lowbar;", "_", $file);
if(checkString($base, 2, 24, 1, 0, 0) && checkString($file, 3, 128, 2, 2, 0)) {
	header('Location: ' . getMirror() . $base . "/" . $file);
} else {
	print("Invalid request");
	http_response_code(400);
}

function getMirror() {
	if($GLOBALS['numMirrors'] == 0) {
		return getBaseUrl(true, $GLOBALS['SBNR_DOMAIN_WHITELIST']) . "/builds/";
	}
	return "https://mirror" . random_int(0, $GLOBALS['numMirrors']) . "." . $_SERVER['SERVER_NAME'] . "/"; //XXX: ADD WHITELIST CHECK HERE TOO (prefix support to getBaseURL?)
}

?>
