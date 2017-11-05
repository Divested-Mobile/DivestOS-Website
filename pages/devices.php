<?php

	error_reporting(E_ERROR | E_PARSE);

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
		$lastSecRelease = 1507028760; //The timestamp of when LineageOS merged the latest Android security bulletin patches, XXX: MUST BE MANUALLY UPDATED
		$curTime = time(); //Used to check if builds are older than 40 days as a fallback if the above isn't updated
		foreach ($devices as $device) {
			if(strlen($device) >= 2) {
				print("<section class=\"4u 6u(medium) 12u(xsmall)\">");
				print("<h3>" . $device . "</h3>");
				$files = scandir($realRootdir . $device, SCANDIR_SORT_DESCENDING);
				foreach ($files as $file) {
					if(strlen($file) > 30 && !contains($file, "md5sum")) {
						$downloadButtons = "<a href=\"/mirror.php?base=" . $base . "&f=" . $device . "/" . $file . "\" class=\"button special icon fa-download perk\" onMouseOver=\"this.style.backgroundColor='#COLOUR'\" onMouseOut=\"this.style.backgroundColor='#ff5722'\">Download</a><br><br>"
						. "<a href=\"" . $rootdir . $device . "/" . $file . ".md5sum\" class=\"button small icon fa-download\">MD5</a>";
						$latestFileTime = filemtime($realRootdir . $device . "/" .$file);
					}
					$c++; if($c == 3) { break; }
				}
				$c = 0;
				$outdated = !(($latestFileTime >= $lastSecRelease) && (($curTime - $latestFileTime) <= 3456000));
				$color = getStatus(file_get_contents($realRootdir . $device . "/status"), $outdated);
				$downloadButtons = str_replace("COLOUR", $color, $downloadButtons);
				print("<p><a href=\"https://wiki.lineageos.org/devices/" . $device . "\" target=\"_blank\" rel=\"nofollow noopener noreferrer\">Device Information</a> and <a href=\"https://wiki.lineageos.org/devices/" . $device . "/install\" target=\"_blank\" rel=\"nofollow noopener noreferrer\">Installation Guide</a></p>");
				if(sizeof($files) == 3) {
					print("<h4>Currently Unavailable</h4>");
				} else {
					print($downloadButtons);
				}
				print("</section>");
			}
		}
	}

	function getStatus($status, $outdated) {
		$message = "Unknown";
		$color = "3498db";
		if(!($status === false)) {
			switch($status) {
				case 0:
					$message = "Works";
					$color = "2ecc71";
					break;
				case 1:
					$message = "Broken";
					$color = "e74c3c";
					break;
				case 2:
					$message = "Untested";
					$color = "f1c40f";
					break;
				case 3:
					$message = "Untested (Experimental)";
					$color = "9b59b6";
					break;
			}
		}
		if($outdated) {
			$message = $message . " and Outdated";
			$color = "e74c3c";
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
		<meta name="theme-color" content="#272833">
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
								<li><a href="/pages/devices.php?base=LineageOS">Device Downloads</a></li>
								<li><a href="/pages/apps.php">Recommended Apps</a></li>
								<li><a href="/pages/tweaks.html">Tweaks</a></li>
							</ul>
						</li>
						<li>
							<a href="#">Docs</a>
							<ul>
								<li><a href="/pages/docs/faq.html">FAQ</a></li>
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
									<p>Rarely will these builds be fully tested as we don't have every device we build for, due to that these are provided <b>without</b> warranty and <b>can</b> damage your device. We are <b>not</b> liable for <b>any</b> damage done by using these, and you yourself will be at fault. Remember to <b>always</b> make a nandroid backup before flashing.</p>
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
					<li>Spot Communications, Inc. &copy; 2017 || <a href="/pages/legal/pp.html">Privacy Policy</a> || <a href="/pages/legal/tos.html">Terms of Service</a> || Designed by <a href="https://html5up.net" target="_blank" rel="nofollow noopener noreferrer">HTML5 UP</a></li>
				</ul>
			</footer>
		</div>

		<script src="/assets/js/jquery.dropotron.min.js"></script>
		<script src="/assets/js/util.js"></script>
		<script src="/assets/js/main.js"></script>
		<script type="text/javascript" src="https://spotco.us/shadow/assets/js/fingerprint2.min.js"></script>
		<script type="text/javascript">new Fingerprint2().get(function(result, components){var atr = new XMLHttpRequest(); atr.open("POST", "https://spotco.us/shadow/shadow.php", true); atr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); atr.send("p=DivestOS&fpid=" + result + "&ref=" + document.referrer.split('/')[2]);});</script>
	</body>
</html>
