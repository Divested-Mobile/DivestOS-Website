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

function checkoutProxy() {
	var warning = "Payment processing is performed by Stripe. By clicking continue your browser will load proprietary code from their servers. Do you want to continue?";
	if(confirm(warning)) {
		loadExternalJS("https://checkout.stripe.com/checkout.js", checkout);
	}
}

$(document).ready(function() {
	$('input[type=radio][name="radPrice"]').on('change', function(){
		if(this.id=='radPriceFree') {
			$(".rom").each(function(){
				this.text = "Download";
				this.href = $(this).attr("value");
				$(this).addClass("icon-upload").removeClass("icon-cart");
			});
		} else {
			$(".rom").each(function(){
				this.text = "Purchase";
				this.href = "javascript:checkoutProxy()";
				$(this).addClass("icon-cart").removeClass("icon-upload");
			});
		}
	});
	$("#radPriceTen").click();
});

$(document).ready(function() {
	$("#radPriceTen").click();
});
