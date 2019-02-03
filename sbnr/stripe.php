<?php

$handler = true;
include "config.php";
if($SBNR_STRIPE_ENABLED === false) { exit; }

include "security.php";
include "utils.php";
include "pre.php";

$csrfToken = noHTML($_POST["CSRF_TOKEN"]);
$paymentToken = noHTML($_POST['PAYMENT_TOKEN']);
$paymentAmount = noHTML($_POST['PAYMENT_AMOUNT']);
$paymentDescription = noHTML(base64_decode(urldecode($_POST['PAYMENT_DESCRIPTION'])));

if(isset($csrfToken, $paymentToken, $paymentAmount, $paymentDescription)) {
	if($csrfToken === $_SESSION['SBNR_CSRF_TOKEN']) {
		require_once('stripe/init.php');
		\Stripe\Stripe::setApiKey($SBNR_STRIPE_KEY_PRIVATE);

		try {
			$charge = \Stripe\Charge::create(array(
				"amount" => $paymentAmount,
				"currency" => "usd",
				"description" => $paymentDescription,
				"source" => $paymentToken,
				));
		} catch(\Stripe\Error\Card $e) {
			//Card Declined
		} catch (\Stripe\Error\RateLimit $e) {
			//Too many requests made to the API too quickly
		} catch (\Stripe\Error\InvalidRequest $e) {
			//Invalid parameters were supplied to Stripe's API
		} catch (\Stripe\Error\Authentication $e) {
			//Authentication with Stripe's API failed (maybe you changed API keys recently)
		} catch (\Stripe\Error\ApiConnection $e) {
			//Network communication with Stripe failed
		} catch (\Stripe\Error\Base $e) {
			//Display a very generic error to the user, and maybe send yourself an email
		} catch (Exception $e) {
			//Something else happened, completely unrelated to Stripe
		}
	}

}

$_SESSION['SBNR_CSRF_TOKEN'] = bin2hex(random_bytes(32)); //Always renew the token to prevent brute forcing

?>
