<?php

require_once('stripe/init.php');

\Stripe\Stripe::setApiKey("pk_test_6pRNASCoBOKtIshFeQd4XMUh");

$token = noHTML($_POST['stripeToken']);

if($token != '') {
	try {
		$charge = \Stripe\Charge::create(array(
			"amount" => 200,
			"currency" => "usd",
			"description" => "Distro Download",
			"source" => $token,
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

//Credit: https://paragonie.com/blog/2015/06/preventing-xss-vulnerabilities-in-php-everything-you-need-know
function noHTML($input, $encoding = 'UTF-8') {
	if($GLOBALS['xssPrevention']) {
		return htmlentities($input, ENT_QUOTES | ENT_HTML5, $encoding);
	} else {
		return $input;
	}
}
?>
