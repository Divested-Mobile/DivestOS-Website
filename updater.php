<?php
//Copyright (c) 2017-2018 Spot Communications, Inc.
//
//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <https://www.gnu.org/licenses/>.

error_reporting(E_ERROR | E_PARSE);

$base = noHTML($_GET["base"]);
$base = str_replace("&period;", ".", $base);
$device = strtolower(noHTML($_GET["device"]));
if(!is_null($base) && strlen($base) > 0 && substr_count($base, '.') <= 1 && substr_count($base, '/') == 0 && !is_null($device) && strlen($device) > 0 && substr_count($device, '.') == 0 && substr_count($device, '/') == 0) {
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
					getImageJson($rootdirInc, $base, $device, $imageInc);
				}
			}
		}
		$images = scandir($rootdir, 0);
		foreach($images as $image) {
			getImageJson($rootdir, $base, $device, $image);
		}
		print("\n\t]");
		print("\n}");
	} else {
		print("Unknown base/device");
		http_response_code(404);
	}
} else {
	print("Invalid request");
	http_response_code(400);
}

function getImageJson($rootdir, $base, $device, $image) {
	if(!contains($image, "md5sum") && strlen($image) > 30) {
		$imageSplit = explode("-", $image); //name-version-date-buildtype-device-[previnc].zip
		if(startsWith(strtolower($imageSplit[4]), $device)) {
			print("\n\t\t{");
			print("\n\t\t\t\"filename\": \"" . $image . "\",");
			if(contains($rootdir, "incremental")) {
				print("\n\t\t\t\"url\": \"https://divestos.xyz/mirror.php?base=" . $base . "&f=" . $device . "/incremental/" . $image . "\",");
			} else {
				print("\n\t\t\t\"url\": \"https://divestos.xyz/mirror.php?base=" . $base . "&f=" . $device . "/" . $image . "\",");
			}
			print("\n\t\t\t\"version\": \"" . $imageSplit[1] . "\",");
			print("\n\t\t\t\"romtype\": \"" . $imageSplit[3] . "\",");
			print("\n\t\t\t\"id\": \"" . md5(file_get_contents($rootdir . "/". $image . ".md5sum")) . "\",");
			print("\n\t\t\t\"datetime\": " . filemtime($rootdir . "/". $image) . ",");
			print("\n\t\t\t\"size\": " . filesize($rootdir . "/". $image));
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
