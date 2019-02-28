<?php

function generateRandomColor($image) {
	imagecolorallocate($image, rand(20, 255), rand(20, 255), rand(20, 255));
}

function applyRandomImageFilter($image) {
	switch(rand(0, 4)) {
		case 0:
			//do nothing
			break;
		case 1:
			imagefilter($image, IMG_FILTER_EDGEDETECT);
			break;
		case 2:
			imagefilter($image, IMG_FILTER_GAUSSIAN_BLUR);
			break;
		case 3:
			imagefilter($image, IMG_FILTER_MEAN_REMOVAL);
			break;
		case 4:
			imagefilter($image, IMG_FILTER_SMOOTH, 1);
			break;
	}
}

function generateTextCaptcha($captchaText) {
	$captcha = imagecreate(300, 100);
	generateRandomColor($captcha); //Set random background color
	$textColor = imagecolorallocate($captcha, 0, 0, 0); //Black text
	$textX = rand(15, 150);
	imagettftext($captcha, 24, rand(-10, 10), $textX, 50, $textColor, getRandomFile("./sbnr/captcha_fonts/"), $captchaText); //Draw the captcha text
	for ($i = 0; $i < rand(8, 20); $i++) { //Add lines
		imagestring($captcha, 1, rand(0, 300), rand(0, 100), generateRandomString(rand(4, 20), '_'), $textColor);
		//imageline($captcha, rand(0, 300), rand(0, 100), rand(0, 300), rand(0, 100), $textColor);
	}
	for ($i = 0; $i < rand(1, 8); $i++) { //Add letters
		imagestring($captcha, 3, rand(0, 300), rand(0, 100), generateRandomString(6), $textColor);
	}
	//applyRandomImageFilter($captcha);
	return $captcha;
}

function getCaptchaText($clear = true) {
	if($clear) { clearCaptchaStore(); }
	$captchaText = generateRandomString(6);
	appendCaptchaStore($captchaText, implode(' ', str_split($captchaText)));
	return generateTextCaptcha($captchaText);
}

function getCaptchaMath($clear = true) {
	if($clear) { clearCaptchaStore(); }
	$num1 = rand(0, 20);
	$num2 = rand(0, 20);
	$captchaText = $num1 . " + " . $num2 . " =";
	appendCaptchaStore(($num1 + $num2), $captchaText);
	return generateTextCaptcha($captchaText);
}

function getCaptchaAudio() {
	ob_start();
		passthru('espeak -v en+f' . rand(1, 5) . ' -s10 -k2 --stdout "' . escapeshellarg($_SESSION['SBNR_CAPTCHA_SPEAK']) . '"');
		$soundFile = ob_get_contents();
	ob_end_clean();
	return 'data:audio/x-wav;base64,' . base64_encode($soundFile);
}

function getCaptchaRandom($clear = true) {
	switch(rand(0, 1)) {
		case 0:
			return getCaptchaText($clear);
		case 1:
			return getCaptchaMath($clear);
	}
}

function getCaptchaMultiple($numParts = 2) {
	clearCaptchaStore();
	$outputImage = imagecreatetruecolor(300, 100 * $numParts);
	for ($i = 0; $i < $numParts; $i++) {
		imagecopy($outputImage, getCaptchaRandom(false), 0, 100 * $i, 0, 0, 300, 100);
	}
	return $outputImage;
}

function clearCaptchaStore() {
	$_SESSION['SBNR_CAPTCHA_ANSWER'] = "";
	$_SESSION['SBNR_CAPTCHA_SPEAK'] = "";
}

function appendCaptchaStore($answer, $raw) {
	$_SESSION['SBNR_CAPTCHA_ANSWER'] .= " " . $answer;
	if(strlen($_SESSION['SBNR_CAPTCHA_SPEAK']) > 0) {
		$_SESSION['SBNR_CAPTCHA_SPEAK'] .= " and";
	}
	$_SESSION['SBNR_CAPTCHA_SPEAK'] .= " " . $raw;
}

function relaxString($text) {
	$text = strtolower($text); //Set to lowercase
	$text = preg_replace('/\s+/', '', $text); //Remove all whitespace
	return $text;
}

function checkCaptchaAnswer($response, $relaxed) {
	if($relaxed) {
		$response = relaxString($response);
		$_SESSION['SBNR_CAPTCHA_ANSWER'] = relaxString($_SESSION['SBNR_CAPTCHA_ANSWER']);
	}
	return $response == $_SESSION['SBNR_CAPTCHA_ANSWER'];
}

function getImageBase64($image) {
	ob_start();
		imagepng($image);
		$imagePNG = ob_get_contents();
	ob_end_clean();
	return 'data:image/png;base64,' . base64_encode($imagePNG);
}

?>
