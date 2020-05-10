<?php

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
