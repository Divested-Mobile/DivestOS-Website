<?php

error_reporting(E_ERROR | E_PARSE);
session_start();

$token = noHTML($_POST['stripeToken']);
$ct = noHTML($_POST["ct"]);

if($token != '' && $_SESSION['csrfToken'] == $ct) {
	$_SESSION['csrfToken'] = bin2hex(random_bytes(64));

	require_once('stripe/init.php');
	\Stripe\Stripe::setApiKey("pk_test_6pRNASCoBOKtIshFeQd4XMUh");

	try {
		$charge = \Stripe\Charge::create(array(
			"amount" => 1000,
			"currency" => "usd",
			"description" => "DivestOS Distro Download",
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
	return htmlentities($input, ENT_QUOTES | ENT_HTML5, $encoding);
}
?>
