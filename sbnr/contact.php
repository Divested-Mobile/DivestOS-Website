<?php

$handler = true;
include "config.php";
if($SBNR_CONTACT_ENABLED === false) { exit; }

include "security.php";
include "captcha.php";
include "utils.php";
include "pre.php";

if(isset($_POST["CSRF_TOKEN"], $_POST["REFERRER"], $_POST["txtName"], $_POST["txtPhone"], $_POST["blackBear"])) {
	if(noHTML($_POST["CSRF_TOKEN"]) === $_SESSION['SBNR_CSRF_TOKEN'] && (noHTML($_POST["blackBear"]) === "roar") && empty($_POST["brownBear"])) {
		$name = noHTML(urldecode($_POST["txtName"]));
		$number = preg_replace("/[^0-9]/", '', noHTML(urldecode($_POST["txtPhone"])));
		if(isset($_POST["txtMessage"])) {
			$message = noHTML(urldecode($_POST["txtMessage"]));
		} else {
			$message = "DISABLED";
		}
		if(strlen($name) <= $SBNR_CONTACT_MAX_LENGTH_NAME
			&& strlen($number) >= $SBNR_CONTACT_MIN_LENGTH_PHONE_NUMBER
			&& strlen($number) <= $SBNR_CONTACT_MAX_LENGTH_PHONE_NUMBER
			&& strlen($message) <= $SBNR_CONTACT_MAX_LENGTH_MESSAGE) {

			if($SBNR_CONTACT_CAPTCHA && !checkCaptchaAnswer(noHTML($_POST["txtCaptcha"]), true)) {
				header("Location: ../index.php?page=" . noHTML($_POST["REFERRER"]) . "&CONTACT_RESULT=Captcha%20Incorrect!#frmContact");
			} else {
				$msentinel = generateRandomString($SBNR_CONTACT_MESSAGE_PREFIX_LENGTH);

				if ($SBNR_CONTACT_GEOIP) {
					$geoIP = $_SERVER["MM_COUNTRY_CODE"];
					if(strlen($_SERVER["MM_CITY_NAME"] .  $_SERVER["MM_REGION_CODE"]) > 1) {
						$geoIP = $_SERVER["MM_CITY_NAME"] . ", " . $_SERVER["MM_REGION_CODE"] . " " . $_SERVER["MM_COUNTRY_CODE"];
					}
					$location = "[" . $msentinel . "] Location: " . $geoIP . "\n";
				}

				$messageResult = "[" . $msentinel . "] MESSAGE START\n" .
						"[" . $msentinel . "] Name: " . $name . "\n" .
						"[" . $msentinel . "] Phone Number: " . $number . "\n" .
						$location .
						"[" . $msentinel . "] Message: \n" . $message . "\n" .
						"[" . $msentinel . "] MESSAGE END";

				exec("echo " . escapeshellarg($messageResult) . " | sendxmpp -f " . $SBNR_CONTACT_SENDXMPP_CONFIG . " -t " . $SBNR_CONTACT_SENDXMPP_RECEIPENT);
				header("Location: ../index.php?page=" . noHTML($_POST["REFERRER"]) . "&CONTACT_RESULT=Message%20Sent!#frmContact");
			}
		} else {
			generateErrorPageBasic(406);
		}
	} else {
		generateErrorPageBasic(401);
	}
} else {
	generateErrorPageBasic(400);
}

$_SESSION['SBNR_CSRF_TOKEN'] = bin2hex(random_bytes(32)); //Always renew the token to prevent brute forcing

?>
