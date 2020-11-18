<?php
//Copyright (c) 2020 Divested Computing Group
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

$handler = true;
include "sbnr/config.php";
if($SBNR_CAPTCHA_STANDALONE_ENABLED === false) { exit; }
include "sbnr/security.php";
putenv('GDFONTPATH=' . realpath('.') . '/sbnr/captcha_fonts/');
include "sbnr/captcha.php";
include "sbnr/utils.php";

if(defined('STDIN')) {
	$captchaText = $argv[1];
} else {
	$captchaText = noHTML($_GET["text"]);
}

if(checkString($captchaText, 4, 12, 0, 0, 0)) {
	$captchaPNG = getImage(generateTextCaptcha($captchaText));
	header("Content-Type: image/png");
	header("Content-Length: " . strlen($captchaPNG));
	echo($captchaPNG);
} else {
	generateErrorPageBasic(400);
}

?>
