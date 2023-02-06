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
$SBNR_GEN_ONE_PAGE = false;
$SBNR_GEN_DARKMODE = false;

//Footer
$SBNR_FOOTER_LEGAL = true;
$SBNR_FOOTER_POWEREDBY = true;

//Obfuscation
$SBNR_OBF_DISABLE_CACHE = false;
$SBNR_OBF_DISABLE_CLIPBOARD = false;
$SBNR_OBF_DISABLE_DEVTOOLS = false;
$SBNR_OBF_DISABLE_HIGHLIGHT = false;
$SBNR_OBF_DISABLE_RIGHT_CLICK = false;

#Utils
include "utils.php";
ob_start("minifyWhitespace");

//Page handling
$page = $argv[1];
$pageRaw = $page;
$page = "stubs/" . $page . ".html";
if(file_exists($page)) { //check if page exists
	$pageIsHome = ($page === "stubs/home.html" || $page === "stubs/home-1p.html");
	include "fragments/header.html";
	include $page;
	include "fragments/footer.html";
}

?>
