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
	session_start();
	$_SESSION['csrfToken'] = bin2hex(random_bytes(32));

	function getDeviceDownloads() {
		$base = noHTML($_GET["base"]);
		$base = str_replace("&period;", ".", $base);
		if(is_null($base) || strlen($base) == 0 || !(substr_count($base, '.') <= 1) || !(substr_count($base, '/') == 0)) {
			error();
			return;
		}
		$rootdir = "/builds/" . $base . "/";
		$realRootdir = $_SERVER['DOCUMENT_ROOT'] . $rootdir;
		if(!(is_dir($realRootdir))) {
			error();
			return;
		}
		$devices = scandir($realRootdir, 0);
		if(sizeof($devices) == 2) {
			print("It appears there are no builds for this base yet...");
			return;
		}
		$lastSecRelease = 1512842600; //The timestamp of when LineageOS merged the latest Android security bulletin patches, XXX: MUST BE MANUALLY UPDATED
		$curTime = time(); //Used to check if builds are older than 40 days as a fallback if the above isn't updated
		foreach ($devices as $device) {
			if(strlen($device) >= 2 && $device != '..') {
				print("<section class=\"4u 6u(medium) 12u(xsmall)\">");
				$name = $device;
				$friendlyNamePath = $realRootdir . $device . "/friendlyName";
				if(file_exists($friendlyNamePath)) {
					$name = file_get_contents($friendlyNamePath) . " (" . $device . ")";
				}
				print("<h3>" . $name . "</h3>");
				print("<p><a href=\"https://wiki.lineageos.org/devices/" . $device . "\" target=\"_blank\" rel=\"nofollow noopener noreferrer\">Device Information</a> and <a href=\"https://wiki.lineageos.org/devices/" . $device . "/install\" target=\"_blank\" rel=\"nofollow noopener noreferrer\">Installation Guide</a></p>");
				$files = scandir($realRootdir . $device);
				if(sizeof($files) <= 4) {
					print("<h4>Currently Unavailable</h4><br><br><br>");
				} else {
					foreach ($files as $file) {
						if($file == "status" || $file == "recovery.img" || contains($file, "md5sum")) {
							continue;
						}
						if(strlen($file) > 30) {
							$downloadButtons = "<a href=\"/mirror.php?base=" . $base . "&f=" . $device . "/" . $file . "\" value=\"/mirror.php?base=" . $base . "&f=" . $device . "/" . $file . "\" class=\"button special icon fa-download perk\" onMouseOver=\"this.style.backgroundColor='#COLOUR'\" onMouseOut=\"this.style.backgroundColor='#ff5722'\">Download</a><br><br>";
							$latestFileTime = filemtime($realRootdir . $device . "/" .$file);
							break;
						}
					}
					if(file_exists($realRootdir . $device . "/recovery.img")) {
						$downloadButtons .= "<a href=\"/mirror.php?base=" . $base . "&f=" . $device . "/recovery.img\" class=\"button small icon fa-undo\">Recovery</a>";
					} else {
						$downloadButtons .= "<br>";
					}
					$outdated = !(($latestFileTime >= $lastSecRelease) && (($curTime - $latestFileTime) <= 3456000));
					$color = getStatus(file_get_contents($realRootdir . $device . "/status"), $outdated);
					$downloadButtons = str_replace("COLOUR", $color, $downloadButtons);
					print($downloadButtons);

				}
				print("</section>");
			}
		}
	}

	function getStatus($status, $outdated) {
		$message = "Unknown";
		$color = "03A9F4";
		if(!($status === false)) {
			switch($status) {
				case 0:
					$message = "Works";
					$color = "4CAF50";
					break;
				case 1:
					$message = "Broken";
					$color = "f44336";
					break;
				case 2:
					$message = "Untested";
					$color = "FFC107";
					break;
				case 3:
					$message = "Untested (Experimental)";
					$color = "673AB7";
					break;
			}
		}
		if($outdated) {
			$message = $message . " and Outdated";
			$color = "f44336";
		}
		print("<h5 style=\"color: #" . $color . ";\">" . $message . "</h5>");
		return $color;
	}

	function error() {
		print("Unknown base!");
		http_response_code(400);
	}

	//Credit: https://stackoverflow.com/a/7112596
	function contains($haystack, $needle) {
		return strpos($haystack, $needle) !== false;
	}

	//Credit: https://paragonie.com/blog/2015/06/preventing-xss-vulnerabilities-in-php-everything-you-need-know
	function noHTML($input, $encoding = 'UTF-8') {
	    return htmlentities($input, ENT_QUOTES | ENT_HTML5, $encoding);
	}

?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Devices - DivestOS</title>
		<meta charset="utf-8" />
		<meta name="theme-color" content="#212121">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="robots" content="noindex, nofollow, noarchive, nosnippet, noodp, notranslate, noimageindex">
		<link href="/images/favicon.png" rel="shortcut icon">
		<link rel="stylesheet" href="/assets/css/main.css" />
		<script src="/assets/js/jquery.min.js"></script>
	</head>
	<body>
		<div id="page-wrapper">
			<header id="header">
				<h1 id="logo"><a href="/index.html">DivestOS</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="/index.html">Home</a></li>
						<li>
							<a href="#">Get Started</a>
							<ul>
								<li><a href="/pages/bootloader.html">Bootloader Unlocking</a></li>
								<li><a href="/pages/devices.php?base=LineageOS">Device Downloads</a></li>
								<li><a href="/pages/post_install.html">Post Install</a></li>
								<li><a href="/pages/troubleshooting.html">Troubleshooting</a></li>
								<li><a href="/pages/apps.php">Recommended Apps</a></li>
								<li><a href="/pages/extras.html">Extras</a></li>
							</ul>
						</li>
						<li>
							<a href="#">Docs</a>
							<ul>
								<li><a href="/pages/docs/faq.html">FAQ</a></li>
								<li><a href="/pages/docs/screenshots.html">Screenshots</a></li>
								<li><a href="/pages/docs/browsers.html">Browser Tables</a></li>
								<li><a href="/pages/docs/broken.html">Functionality Tables</a></li>
								<li><a href="/pages/docs/build.html">Build Guide</a></li>
							</ul>
						</li>
						<li><a href="https://gitea.divestos.xyz/DivestOS" target="_blank" rel="nofollow noopener noreferrer">Source Code</a></li>
						<li><a href="/pages/about.html">About</a></li>
					</ul>
				</nav>
			</header>

			<div id="main" class="wrapper style1">
				<div class="container">
					<header class="major">
						<h2>Device Downloads</h2>
						<p>Releases are typically done on a fortnightly schedule unless there are major or security related changes.</p>
						<p>Currently in pre-release stage, please do *not* share, file mirror servers have not been set up yet.</p>
						<div class="box alt">
							<div class="row uniform">
								<section class="4u 12u(medium) 12u$(xsmall)">
									<h3>Disclaimer</h3>
									<p>Rarely will these builds be fully tested as we don't have every device we build for, due to that these are provided <b>without</b> warranty and <b>can</b> damage your device. We are <b>not</b> liable for <b>any</b> damage done by using these, and you yourself will be at fault.</p>
								</section>
								<section class="4u 12u$(medium) 12u$(xsmall)">
									<h3>Root</h3>
									<p>These are 'user' builds, root is not included. It is not recommended to flash any other zips alongside our builds. Root frameworks and runtime modification frameworks (like Xposed) will <b>severly decrease</b> the security of your device.</p>

								</section>
								<section class="4u$ 12u(medium) 12u$(xsmall)">
									<h3>Signed Builds</h3>
									<p>All builds published are signed with our signing keys (CN: Spot Communications), unlike other ROMs that simply use test-keys. This means that when switching to or away from our builds, you will be prompted to wipe /data.</p>
								</section>
							</div>
						</div>
					</header>

					<section id="content">
						<div style="text-align:center;">
							<h3>Name Your Price</h3>
							<input type="radio" id="radPriceFree" name="radPrice">
							<label for="radPriceFree" id="lblPriceFree">Free</label>
							<input type="radio" id="radPriceTen" name="radPrice">
							<label for="radPriceTen">$10</label>
							<p id="lblThanks" hidden>Thank you for your contribution!</p>
						</div>
						<div class="box alt">
							<div class="row uniform" style="text-align:center;">
								<?php getDeviceDownloads(); ?>
							</div>
						</div>
					</section>
				</div>
			</div>

			<footer id="footer">
				<ul class="copyright">
					<li>Spot Communications, Inc. &copy; 2017-2018 || <a href="/pages/legal/pp.html">Privacy Policy</a> || <a href="/pages/legal/tos.html">Terms of Service</a> || Designed by <a href="https://html5up.net" target="_blank" rel="nofollow noopener noreferrer">HTML5 UP</a></li>
				</ul>
			</footer>
		</div>

		<script src="/assets/js/jquery.dropotron.min.js"></script>
		<script src="/assets/js/util.js"></script>
		<script src="/assets/js/main.js"></script>
		<script type="text/javascript" src="https://spotco.us/shadow/assets/js/fingerprint2.min.js"></script>
		<script type="text/javascript">new Fingerprint2().get(function(result, components){var atr = new XMLHttpRequest(); atr.open("POST", "https://spotco.us/shadow/shadow.php", true); atr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); atr.send("p=DivestOS&fpid=" + result + "&ref=" + document.referrer.split('/')[2]);});</script>
		<script src="https://checkout.stripe.com/checkout.js"></script>
		<script type="text/javascript">
		function checkout() {
			var handler = StripeCheckout.configure({
				key: 'pk_test_6pRNASCoBOKtIshFeQd4XMUh',
				image: '/images/spotco.png',
				locale: 'auto',
				allowRememberMe: false,
				token: function(token) {
					var req = new XMLHttpRequest();
					req.onreadystatechange = function() {
						if (req.readyState == 4 && req.status == 200) {
							setTimeout(function() {
								$("#lblThanks").attr("hidden", false);
								$("#radPriceTen").attr("disabled", true);
								$("#radPriceFree").click();
								$("#lblPriceFree").text("Purchased");
								$("#radPriceFree").attr("disabled", true);
							}, 500);
						}
					};
					req.open("POST", "processor.php", true);
					req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					req.send("token=" + token.id + "&ct=<?php print($_SESSION['csrfToken']); ?>");
				}
			});

			handler.open({
				name: 'Spot Communications, Inc.',
				description: 'DivestOS Distro Download',
				zipCode: true,
				amount: 1000
			});

			window.addEventListener('popstate', function() {
				handler.close();
			});
		}
		$(document).ready(function() {
			$('input[type=radio][name="radPrice"]').on('change', function(){
				if(this.id=='radPriceFree') {
					$(".perk").each(function(){
						this.text = "Download";
						this.href = $(this).attr("value");
						$(this).addClass("fa-download").removeClass("fa-lock");
					});
				} else {
					$(".perk").each(function(){
						this.text = "Purchase";
						this.href = "javascript:checkout()";
						$(this).addClass("fa-lock").removeClass("fa-download");
					});
				}
			});
			$("#radPriceTen").click();
		});

		$(document).ready(function() {
			$("#radPriceTen").click();
		});
		</script>
	</body>
</html>
