<?php
//Copyright (c) 2017 Spot Communications, Inc.

$device = strtolower(noHTML($_GET["device"]));
if(!$device == '') {
	$rootdir = "devices/" . $device;
	if(file_exists($rootdir)) {
		$images = scandir($rootdir, 0);
		print("{");
		print("\n\t\"response\": [");
		foreach ($images as $image) {
			if(!contains($image, "md5sum") && strlen($image) > 30) {
				$imageSplit = explode("-", $image); //name-version-date-buildtype-device.zip
				print("\n\t\t{");
				print("\n\t\t\t\"filename\": \"" . $image . "\",");
				print("\n\t\t\t\"url\": \"https://divestos.xyz/mirror.php?f=" . $device . "/" . $image . "\",");
				print("\n\t\t\t\"datetime\": " . filemtime($rootdir . "/". $image) . ",");
                                print("\n\t\t\t\"romtype\": \"" . $imageSplit[3] . "\",");
                                print("\n\t\t\t\"version\": \"" . $imageSplit[1] . "\"");
				print("\n\t\t},");
			}
		}
		print("\n\t]");
		print("\n}");
	} else {
		print("Unknown device");
		http_response_code(404);
	}
} else {
	print("Invalid request");
	http_response_code(400);
}
//Credit: https://paragonie.com/blog/2015/06/preventing-xss-vulnerabilities-in-php-everything-you-need-know
function noHTML($input, $encoding = 'UTF-8') {
    return htmlentities($input, ENT_QUOTES | ENT_HTML5, $encoding);
}

//Credit: https://stackoverflow.com/a/7112596
function contains($haystack, $needle) {
    return strpos($haystack, $needle) !== false;
}
?>
