<?php
//Copyright (c) 2019-2020 Divested Computing Group
//
//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU Lesser General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU Lesser General Public License for more details.
//
//You should have received a copy of the GNU Lesser General Public License
//along with this program.  If not, see <https://www.gnu.org/licenses/>.

session_start();

//Generate a CSRF token
if(($handler === false && $SBNR_SEC_CSRF_PER_REQUEST) || !isset($_SESSION['SBNR_CSRF_TOKEN'])) {
	$_SESSION['SBNR_CSRF_TOKEN'] = bin2hex(random_bytes(32));
}

//Save-Data Header Support
$saveData = false;
if(isset($_SERVER["HTTP_SAVE_DATA"]) && strtolower($_SERVER["HTTP_SAVE_DATA"]) === "on") {
	$saveData = true;
}
if(endsWith(noHTML($_SERVER['SERVER_NAME']), "&period;onion")) {
	$saveData = true;
}

if($SNBR_OBF_MINIFY) {
	ob_start("minifyWhitespace");
}

?>
