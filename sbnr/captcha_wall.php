<?php

$handler = true;
include "config.php";
if($SBNR_CAPTCHA_WALL === false && sizeof($SBNR_CAPTCHA_WALL_PAGES) === 0) { exit; }

include "security.php";
include "captcha.php";
include "utils.php";
include "pre.php";

if(isset($_POST["CSRF_TOKEN"], $_POST["blackBear"])) {
	if(noHTML($_POST["CSRF_TOKEN"]) === $_SESSION['SBNR_CSRF_TOKEN'] && (noHTML($_POST["blackBear"]) === "roar") && empty($_POST["brownBear"])) {
		if(checkCaptchaAnswer(noHTML($_POST["txtCaptcha"]), true)) {
			$_SESSION['SBNR_CAPTCHA_WALL_PASSED'] = true;
			http_response_code(200);
		} else {
			$_SESSION['SBNR_CAPTCHA_WALL_PASSED'] = false;
			http_response_code(403);
		}
	} else {
		http_response_code(401);
	}
} else {
	http_response_code(400);
}

if(!empty($_SESSION['SBNR_CAPTCHA_WALL_URI'])) {
	//This is only set by index.php meaning it'll redirect back to index.php and go through the usual checks
	header("Location: " . $_SESSION['SBNR_CAPTCHA_WALL_URI']);
} else {
	header("Location: ../index.php");
}

$_SESSION['SBNR_CAPTCHA_WALL_URI'] = "";
$_SESSION['SBNR_CSRF_TOKEN'] = bin2hex(random_bytes(32)); //Always renew the token to prevent brute forcing

?>
