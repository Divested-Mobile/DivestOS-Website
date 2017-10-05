<?php
//Copyright (c) 2017 Spot Communications, Inc.

error_reporting(E_ERROR | E_PARSE);

$base = noHTML($_GET["base"]);
$base = str_replace("&period;", ".", $base);
$device = strtolower(noHTML($_GET["device"]));
if(!is_null($base) && substr_count($base, '.') <= 1 && substr_count($base, '/') == 0 && !is_null($device) && strlen($device) > 0 && substr_count($device, '.') == 0 && substr_count($device, '/') == 0) 
{
	$rootdir = "builds/" . $base . "/" . $device;
	$rootdirInc = $rootdir . "/incremental/";
	if(is_dir($rootdir)) {
		print("{");
		print("\n\t\"response\": [");
		if(isset($_GET["inc"]) && file_exists($rootdirInc)) {
			$inc = noHTML($_GET["inc"]);
			$imagesInc = scandir($rootdirInc, 0);
			foreach($imagesInc as $imageInc) {
				$imageSplit = explode("-", $imageInc);
				if($imageSplit[5] == $inc) {
					getImageJson($rootdirInc, $device, $imageInc);
				}
			}
		}
		$images = scandir($rootdir, 0);
		foreach($images as $image) {
			getImageJson($rootdir, $device, $image);
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

function getImageJson($rootdir, $base, $device, $image) {
	if(!contains($image, "md5sum") && strlen($image) > 30) {
		$imageSplit = explode("-", $image); //name-version-date-buildtype-device-[previnc].zip
		if(startsWith($imageSplit[4], $device)) {
			print("\n\t\t{");
			print("\n\t\t\t\"filename\": \"" . $image . "\",");
			if(contains($rootdir, "incremental")) {
				print("\n\t\t\t\"url\": \"https://divestos.xyz/mirror.php?b=" . $base . "f=" . $device . "/incremental/" . $image . "\",");
			} else {
				print("\n\t\t\t\"url\": \"https://divestos.xyz/mirror.php?b=" . $base . "f=" . $device . "/" . $image . "\",");
			}
			print("\n\t\t\t\"version\": \"" . $imageSplit[1] . "\",");
			print("\n\t\t\t\"romtype\": \"" . $imageSplit[3] . "\",");
                        print("\n\t\t\t\"id\": \"" . md5(file_get_contents($rootdir . "/". $image . ".md5sum")) . "\",");
			print("\n\t\t\t\"datetime\": " . filemtime($rootdir . "/". $image));
			print("\n\t\t},");
		}
	}
}

//Credit: https://paragonie.com/blog/2015/06/preventing-xss-vulnerabilities-in-php-everything-you-need-know
function noHTML($input, $encoding = 'UTF-8') {
    return htmlentities($input, ENT_QUOTES | ENT_HTML5, $encoding);
}

//Credit: https://stackoverflow.com/a/7112596
function contains($haystack, $needle) {
    return strpos($haystack, $needle) !== false;
}

//Credit: http://stackoverflow.com/a/10473026
function startsWith($haystack, $needle) {
    // search backwards starting from haystack length characters from the end
    return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== FALSE;
}
?>
