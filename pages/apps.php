<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Apps - DivestOS</title>
		<meta charset="utf-8" />
		<meta name="theme-color" content="#212121">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="robots" content="noindex, nofollow, noarchive, nosnippet, noodp, notranslate, noimageindex">
		<link href="/images/favicon.png" rel="shortcut icon">
		<link rel="stylesheet" href="/assets/css/main.css" />
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
						<h2>Recommended Apps from F-Droid</h2>
						<p>Visit this list after installing DivestOS or F-Droid to your device</p>
					</header>

					<section id="content">
						<h3>On Messaging Apps</h3>
						<p>DivestOS includes Silence, a SMS only fork of Signal, it allows sending encrypted SMS messages to other users of Silence (such as CopperheadOS users). It is not however recommended for use as your primary messaging client, and is there more as a fallback. In the future we hope we can recommended the use of Signal, but it currently bundles proprietary Google libraries and doesn't allow forcing WebSocket mode. But for now and hopefully always into the future we do wholly recommend Conversations, a top notch XMPP client, fully supports the OMEMO XEP, is easy on the battery, and doesn't force you into a walled garden. There are many apps that we do not recommend, due to being proprietary or fundamentally insecure, but they shall remain nameless. It is not the easiest thing getting your friends and family to switch apps, so at the very least any apps with end-to-end encryption support should always be preferred over apps without E2E.</p>
						<h3>On Keyboard Apps</h3>
						<p>Do not ever use any keyboard apps that are proprietary and/or require network permission. It doesn't matter how great that autocomplete is, its garbage if its sending everything you type to a server somewhere just to be data mined. It doesn't even matter if it has a "good" privacy policy or if you trust the creator, sending it away incurs the chance of being intercepted by a less trusted party.</p>
						<h3>On Web Browsers</h3>
						<p>Please go to the browser tables page <a href="/pages/docs/browsers.html">here</a></p>

						<?php print(file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/pages/apps.html")); ?>
					</section>
				</div>
			</div>

			<footer id="footer">
				<ul class="copyright">
					<li>Spot Communications, Inc. &copy; 2017-2018 || <a href="/pages/legal/pp.html">Privacy Policy</a> || <a href="/pages/legal/tos.html">Terms of Service</a> || Designed by <a href="https://html5up.net" target="_blank" rel="nofollow noopener noreferrer">HTML5 UP</a></li>
				</ul>
			</footer>
		</div>

		<script src="/assets/js/jquery.min.js"></script>
		<script src="/assets/js/jquery.dropotron.min.js"></script>
		<script src="/assets/js/util.js"></script>
		<script src="/assets/js/main.js"></script>
		<script type="text/javascript" src="https://spotco.us/shadow/assets/js/fingerprint2.min.js"></script>
		<script type="text/javascript">new Fingerprint2().get(function(result, components){var atr = new XMLHttpRequest(); atr.open("POST", "https://spotco.us/shadow/shadow.php", true); atr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); atr.send("p=DivestOS&fpid=" + result + "&ref=" + document.referrer.split('/')[2]);});</script>
	</body>
</html>
