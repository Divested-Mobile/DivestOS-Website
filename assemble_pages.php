<?php
//Copyright (c) 2017-2020 Divested Computing Group
//
//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU Affero General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU Affero General Public License for more details.
//
//You should have received a copy of the GNU Affero General Public License
//along with this program.  If not, see <https://www.gnu.org/licenses/>.

//General
$SBNR_GEN_DARKMODE = false;

//Utils
//Credit (CC BY-SA 3.0): https://stackoverflow.com/a/6225706
function minifyWhitespace($buffer) {
	$search = array(
	'/\>[^\S ]+/s',     // strip whitespaces after tags, except space
	'/[^\S ]+\</s',     // strip whitespaces before tags, except space
	'/(\s)+/s',         // shorten multiple whitespace sequences
	'/<!--(.|\s)*?-->/' // remove HTML comments
	);

	$replace = array(
	'>',
	'<',
	'\\1',
	''
	);

	$buffer = preg_replace($search, $replace, $buffer);

	return $buffer;
}
ob_start("minifyWhitespace");

//Page handling
$page = $argv[1];
$pageRaw = $page;
$page = "stubs/" . $page . ".html";
if(file_exists($page)) { //check if page exists
	$pageIsHome = ($page === "stubs/home.html");
	include "fragments/header.html";
	include $page;
	include "fragments/footer.html";
}

?>
