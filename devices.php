<?php
	session_start();
	$_SESSION['csrfToken'] = bin2hex(mcrypt_create_iv(32, MCRYPT_DEV_URANDOM));

	$loc = 0;
	function getDeviceDownloads() {
		$four = "";
		$six = "";
		$twelve = "$";
		if($GLOBALS["loc"]=='1') {
			$six = "$";
			$GLOBALS["loc"] = 2;
		} else if ($GLOBALS["loc"]=='2') {
			$four = "$";
			$GLOBALS["loc"] = 0;
		}
		$rootdir = "devices/";
		$devices = scandir($rootdir, 0);
		foreach ($devices as $device) {
			if(strlen($device) > 2) {
				print("<section class=\"4u" . $four . " 6u" . $six . "(medium) 12u" . $twelve . "(xsmall)\">");
				print("<h3>" . $device . "</h3>");
				print("<p><a href=\"https://wiki.lineageos.org/devices/" . $device . "\" target=\"_blank\" rel=\"nofollow noopener noreferrer\">Device Information</a> and <a href=\"https://wiki.lineageos.org/devices/" . $device . "/install\" target=\"_blank\" rel=\"nofollow noopener noreferrer\">Installation Guide</a></p>");
				$files = scandir($rootdir . $device, 0);
				foreach ($files as $file) {
					if(strlen($file) > 30) {
						if(contains($file, "md5sum")) {
							print("<a href=\"" . $rootdir . $device . "/" . $file . "\" class=\"button small icon fa-download\">MD5</a>");
						} else {
							print("<a href=\"#\" value=\"" . $rootdir . $device . "/" . $file . "\" class=\"button special icon fa-download perk\">Loading...</a><br><br>");
						}
					}
				}
				if(sizeof($files) == 2) {
					print("<h4>Currently Unavailable</h4><br><br><br>");
				}
				print("</section>");
			}
		}
	}

	//Credit: https://stackoverflow.com/a/7112596
	function contains($haystack, $needle) {
		return strpos($haystack, $needle) !== false;
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
		<link href="images/favicon.png" rel="shortcut icon">
		<link rel="stylesheet" href="assets/css/main.css" />
		<script src="assets/js/jquery.min.js"></script>
	</head>
	<body>
		<div id="page-wrapper">
			<header id="header">
				<h1 id="logo"><a href="index.html">DivestOS</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li>
							<a href="#">Get Started</a>
							<ul>
								<li><a href="devices.php">Device Downloads</a></li>
								<li><a href="apps.html">Recommended Apps</a></li>
								<li><a href="tweaks.html">Tweaks</a></li>
								<li><a href="broken.html">Functionality Tables</a></li>
							</ul>
						</li>
						<li><a href="https://gitea.divestos.xyz/DivestOS" target="_blank" rel="nofollow noopener noreferrer">Source Code</a></li>
						<li><a href="about.html">About</a></li>
					</ul>
				</nav>
			</header>

			<div id="main" class="wrapper style1">
				<div class="container">
					<header class="major">
						<h2>Device Downloads</h2>
						<p>Releases are typically done on a weekly schedule unless there are major or security related changes.</p>
						<div class="box alt">
							<div class="row uniform">
								<section class="4u 6u(medium) 12u$(xsmall)">
									<h3>Disclaimer</h3>
									<p>Rarely will these builds be fully tested as we don't have every device we build for, due to that these are provided <b>without</b> warranty and <b>can</b> damage your device. We are <b>not</b> liable for <b>any</b> damage done by using these, and you yourself will be at fault. Remember to <b>always</b> make a nandroid backup before flashing.</p>
								</section>
								<section class="4u 6u$(medium) 12u$(xsmall)">
									<h3>Root</h3>
									<p>These are 'user' builds, root is not included. It is not recommended to flash any other zips alongside our builds. Root frameworks and runtime modification frameworks (like Xposed) will <b>severly decrease</b> the security of your device.</p>

								</section>
								<section class="4u$ 6u(medium) 12u$(xsmall)">
									<h3>Signed Builds</h3>
									<p>All builds published are signed with our signing keys (CN: Spot Communications), unlike other ROMs that simply use test-keys. This means that when switching to or away from our builds, you will be prompted to wipe /data.</p>
								</section>
							</div>
						</div>
					</header>

					<section id="content">
						<div class="box alt">
							<div class="row uniform" style="text-align: center;">
								<section class="4u 6u(medium) 12u$(xsmall)">
								</section>
								<section class="4u 6u$(medium) 12u$(xsmall)">
									<h3>Name Your Price</h3>
									<input type="radio" id="radPriceFree" name="radPrice">
									<label for="radPriceFree">Free</label>
									<input type="radio" id="radPriceThree" name="radPrice" value=200>
									<label for="radPriceThree">$3</label>
									<p id="lblThanks" hidden>Thank you for your contribution!</p>
								</section>
								<section class="4u$ 6u(medium) 12u$(xsmall)">
								</section>
								<?php getDeviceDownloads(); ?>
							</div>
						</div>
					</section>

					<script src="https://checkout.stripe.com/checkout.js"></script>
					<script type="text/javascript">
					//Credit: https://stackoverflow.com/a/5448595
					function checkout() {
						var handler = StripeCheckout.configure({
							key: 'pk_test_6pRNASCoBOKtIshFeQd4XMUh',
							image: 'images/spotco.png',
							locale: 'auto',
							bitcoin: true,
							allowRememberMe: false,
							token: function(token) {
								var req = new XMLHttpRequest();
								req.onreadystatechange = function() {
									if (req.readyState == 4 && req.status == 200) {
										setTimeout(function() {
											$("#lblThanks").attr("hidden", false);
											$("#radPriceThree").attr("disabled", true);
											$("#radPriceFree").click();
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
							amount: 300
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
						$("#radPriceThree").click();
						//$("#radPriceFree").click();
					});
					</script>
				</div>
			</div>

			<footer id="footer">
				<ul class="copyright">
					<li>Spot Communications, Inc. &copy; 2017 || Designed by <a href="https://html5up.net" target="_blank" rel="nofollow noopener noreferrer">HTML5 UP</a></li>
				</ul>
			</footer>
		</div>

		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		<script type="text/javascript" src="https://spotco.us/shadow/assets/js/fingerprint2.min.js"></script>
		<script type="text/javascript">new Fingerprint2().get(function(result, components){var atr = new XMLHttpRequest(); atr.open("POST", "https://spotco.us/shadow/shadow.php", true); atr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); atr.send("p=DivestOS&fpid=" + result + "&ref=" + document.referrer.split('/')[2]);});</script>
	</body>
</html>
