<?php
//Copyright (c) 2017-2019 Divested Computing, Inc.
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

$handler = true;
include "sbnr/config.php";
include "sbnr/security.php";
include "sbnr/utils.php";
include "sbnr/pre.php";

$base = noHTML($_GET["base"]);
$base = str_replace("&period;", ".", $base);
$device = strtolower(noHTML($_GET["device"]));
$inc = noHTML($_GET["inc"]);
if(!is_null($base) && strlen($base) > 0 && substr_count($base, '.') <= 1 && substr_count($base, '/') == 0 && !is_null($device) && strlen($device) > 0 && substr_count($device, '.') == 0 && substr_count($device, '/') == 0 && (empty($inc) || (!empty($inc) && strlen($inc) < 22))) {
	$rootdir = "builds/" . $base . "/" . $device;
	$rootdirInc = $rootdir . "/incremental/";
	if(is_dir($rootdir)) {
		$result = getCachedDeviceJson($rootdir, $rootdirInc, $base, $device, $inc);
		$result = str_replace("invalid://invalid.invalid", getBaseURL(true, $SBNR_DOMAIN_WHITELIST), $result);
		if(contains($result, "invalid://invalid.invalid")) {
			print("Invalid request");
			http_response_code(400);
		} else {
			print($result);
		}
	} else {
		print("Unknown base/device");
		http_response_code(404);
	}
} else {
	print("Invalid request");
	http_response_code(400);
}

function getCachedDeviceJson($rootdir, $rootdirInc, $base, $device, $inc) {
	if(extension_loaded("redis")) {
		$result = "";
		$redis = new Redis();
		$redis->connect('127.0.0.1');
		$cacheKey = "DivestOS+updater.php+base:" . $base . "+device:" . $device;
		if(!empty($inc)) {
			$cacheKey .= "+inc:" . $inc;
		}
		if(($result = $redis->get($cacheKey)) == false) {
			$result = getDeviceJson($rootdir, $rootdirInc, $base, $device, $inc);
			$redis->setEx($cacheKey, 3600, $result);
		}
		$redis->close();
		return $result;
	} else {
		return getDeviceJson($rootdir, $rootdirInc, $base, $device, $inc);
	}
}

function getDeviceJson($rootdir, $rootdirInc, $base, $device, $inc) {
	$fullJson = "";
	$fullJson .= "{";
	$fullJson .= "\n\t\"response\": [";
	if(!empty($inc) && file_exists($rootdirInc)) {
		$imagesInc = scandir($rootdirInc, 1);
		foreach($imagesInc as $imageInc) {
			$imageSplit = explode("-", $imageInc);
			if($imageSplit[5] == $inc) {
				$fullJson .= getImageJson($rootdirInc, $base, $device, $imageInc);
			}
		}
	}
	$images = scandir($rootdir, 1);
	foreach($images as $image) {
		$fullJson .= getImageJson($rootdir, $base, $device, $image);
	}
	$fullJson .= "\n\t]";
	$fullJson .= "\n}";
	return $fullJson;
}

function getImageJson($rootdir, $base, $device, $image) {
	if(!contains($image, "md5sum") && strlen($image) > 30) {
		$imageSplit = explode("-", $image); //name-version-date-buildtype-device-[previnc].zip
		if(startsWith(strtolower($imageSplit[4]), $device)) {
			$json = "";
			$json .= "\n\t\t{";
			$json .= "\n\t\t\t\"filename\": \"" . $image . "\",";
			if(contains($rootdir, "incremental")) {
				$json .= "\n\t\t\t\"url\": \"invalid://invalid.invalid" . "/mirror.php?base=" . $base . "&f=" . $device . "/incremental/" . $image . "\",";
			} else {
				$json .= "\n\t\t\t\"url\": \"invalid://invalid.invalid" . "/mirror.php?base=" . $base . "&f=" . $device . "/" . $image . "\",";
			}
			$json .= "\n\t\t\t\"version\": \"" . $imageSplit[1] . "\",";
			$json .= "\n\t\t\t\"romtype\": \"" . $imageSplit[3] . "\",";
			$json .= "\n\t\t\t\"id\": \"" . md5(file_get_contents($rootdir . "/". $image . ".md5sum")) . "\",";
			$json .= "\n\t\t\t\"datetime\": " . filemtime($rootdir . "/". $image) . ",";
			$json .= "\n\t\t\t\"size\": " . filesize($rootdir . "/". $image);
			$json .= "\n\t\t},";
			return $json;
		}
	}
}

?>
