<?php
	function getDeviceDownloads($device) {
		print("<h3>" . $device . "</h3>");
		print("<p><a href=\"http://wiki.lineageos.org/" . $device . "_info.html\" target=\"_blank\" rel=\"nofollow noopener noreferrer\">Device Information</a> and <a href=\"http://wiki.lineageos.org/" . $device . "_install.html\" target=\"_blank\" rel=\"nofollow noopener noreferrer\">Installation Guide</a></p>");
		print("<ul>");
		$rootdir = "downloads/" . $device;
		$files = scandir($rootdir, 1);

		foreach ($files as $file) {
			if(strlen($file) > 2) {
				print("<li><a href=\"" . $rootdir . "/" . $file . "\" target=\"_blank\">" . $file . "</a></li>");
			}
		}
		print("</ul>");
	}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Deblobbed Android</title>
		<meta charset="utf-8" />
		<meta name="theme-color" content="#272833">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="robots" content="noindex, nofollow, noarchive, nosnippet, noodp, notranslate, noimageindex">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>
		<div id="page-wrapper">
			<header id="header">
				<h1 id="logo"><a href="index.html">Deblobbed Android</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="apps.html" >Apps</a></li>
						<li><a href="devices.php" class="active">Devices</a></li>
						<li><a href="#" target="_blank" rel="nofollow noopener noreferrer">Source Code</a></li>
					</ul>
				</nav>
			</header>

			<div id="main" class="wrapper style1">
				<div class="container">
					<header class="major">
						<h2>Device Downloads</h2>
						<p>Releases are typically done on a weekly schedule unless there are major or security related changes. Rarely will these builds be fully tested as we don't have every device we build for, due to that these are provided <b>without</b> warranty and <b>can</b> damage your device. We are <b>not</b> liable for <b>any</b> damage done by using these, and you yourself will be at fault. Remember to always make a nandroid backup before flashing.</p>
					</header>

					<section id="content">
						<section id="content">
							<?php getDeviceDownloads("angler"); ?>
							<?php getDeviceDownloads("bacon"); ?>
							<?php getDeviceDownloads("bullhead"); ?>
							<?php getDeviceDownloads("clark"); ?>
							<?php getDeviceDownloads("hammerhead"); ?>
							<?php getDeviceDownloads("mako"); ?>
							<?php getDeviceDownloads("osprey"); ?>
							<?php getDeviceDownloads("shamu"); ?>
							<?php getDeviceDownloads("thor"); ?>
							<?php getDeviceDownloads("vs985"); ?>
							<?php getDeviceDownloads("Z00T"); ?>
						</section>
					</section>
				</div>
			</div>

			<footer id="footer">
				<ul class="copyright">
					<li>Spot Communications, Inc. &copy; 2017 || Designed by <a href="https://html5up.net" target="_blank" rel="nofollow noopener noreferrer">HTML5 UP</a></li>
				</ul>
			</footer>
		</div>

		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="assets/js/main.js"></script>
		<script type="text/javascript" src="https://spotco.us/shadow/assets/js/fingerprint2.min.js"></script>
		<script type="text/javascript">new Fingerprint2().get(function(result, components){var atr = new XMLHttpRequest(); atr.open("POST", "https://spotco.us/shadow/shadow.php", true); atr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); atr.send("p=DeblobbedAndroid&fpid=" + result + "&ref=" + document.referrer.split('/')[2]);});</script>
	</body>
</html>
