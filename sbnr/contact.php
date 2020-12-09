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

$handler = true;
include "config.php";
if($SBNR_CONTACT_ENABLED === false) { exit; }

include "security.php";
include "captcha.php";
include "utils.php";
include "pre.php";

if(isset($_POST["CSRF_TOKEN"], $_POST["REFERRER"], $_POST["txtName"], $_POST["blackBear"])) {
	if(noHTML($_POST["CSRF_TOKEN"]) === $_SESSION['SBNR_CSRF_TOKEN'] && (noHTML($_POST["blackBear"]) === "roar") && empty($_POST["brownBear"])) {
		$name = noHTML(urldecode($_POST["txtName"]));
		$email = noHTML(urldecode($_POST["txtEmail"]));
		$number = preg_replace("/[^0-9]/", '', noHTML(urldecode($_POST["txtPhone"])));
		if(isset($_POST["txtMessage"])) {
			$message = noHTML(urldecode($_POST["txtMessage"]));
		} else {
			$message = "DISABLED";
		}
		if(strlen($name) <= $SBNR_CONTACT_MAX_LENGTH_NAME
			&& strlen($email) <= $SBNR_CONTACT_MAX_LENGTH_EMAIL
			&& strlen($number) <= $SBNR_CONTACT_MAX_LENGTH_PHONE_NUMBER
			&& strlen($message) <= $SBNR_CONTACT_MAX_LENGTH_MESSAGE) {

			if($SBNR_CONTACT_CAPTCHA && !checkCaptchaAnswer(noHTML($_POST["txtCaptcha"]), true)) {
				header("Location: ../index.php?page=" . noHTML($_POST["REFERRER"]) . "&CONTACT_RESULT=Captcha%20Incorrect!#frmContact");
			} else {
				$msentinel = generateRandomString($SBNR_CONTACT_MESSAGE_PREFIX_LENGTH, false);

				if ($SBNR_CONTACT_GEOIP) {
					$geoIP = $_SERVER["MM_COUNTRY_CODE"];
					if(strlen($_SERVER["MM_CITY_NAME"] .  $_SERVER["MM_REGION_CODE"]) > 1) {
						$geoIP = $_SERVER["MM_CITY_NAME"] . ", " . $_SERVER["MM_REGION_CODE"] . " " . $_SERVER["MM_COUNTRY_CODE"];
					}
					$location = "[" . $msentinel . "] Location: " . $geoIP . "\n";
				}

				$messageResult = "[" . $msentinel . "] MESSAGE START\n" .
						"[" . $msentinel . "] Name: " . $name . "\n" .
						"[" . $msentinel . "] E-Mail: " . $email . "\n" .
						"[" . $msentinel . "] Phone Number: " . $number . "\n" .
						$location .
						"[" . $msentinel . "] Message: \n" . $message . "\n" .
						"[" . $msentinel . "] MESSAGE END\n";

				if($SBNR_CONTACT_OUTPUT === "TEXT") {
					file_put_contents($SBNR_CONTACT_TEXT_FILE, escapeshellarg($messageResult), FILE_APPEND);
				} else if($SBNR_CONTACT_OUTPUT === "XMPP") {
					exec("echo " . escapeshellarg($messageResult) . " | sendxmpp -f " . $SBNR_CONTACT_SENDXMPP_CONFIG . " -t " . $SBNR_CONTACT_SENDXMPP_RECEIPENT);
				}


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
