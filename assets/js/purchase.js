function checkout() {
	var handler = StripeCheckout.configure({
		key: 'pk_test_6pRNASCoBOKtIshFeQd4XMUh',
		locale: 'auto',
		allowRememberMe: false,
		token: function(token) {
			var req = new XMLHttpRequest();
			req.onreadystatechange = function() {
				if (req.readyState == 4 && req.status == 200) {
					setTimeout(markPurchased, 500);
				}
			};
			req.open("POST", "processor.php", true);
			req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			req.send("token=" + token.id + "&ct=" + getCSRFToken());
		}
	});

	handler.open({
		name: 'Divested Computing, Inc.',
		description: 'DivestOS Mobile Download',
		zipCode: true,
		amount: 1000
	});

	window.addEventListener('popstate', function() {
		handler.close();
	});
}

function markPurchased() {
	document.getElementById("lblThanks").hidden = false;
	document.getElementById("radPriceTen").disabled = true;
	document.getElementById("radPriceFree").click();
	document.getElementById("lblPriceFree").textContent = "Purchased";
	document.getElementById("radPriceFree").disabled = true;
}

function checkoutProxy() {
	var warning = "Payment processing is performed by Stripe. By continuing your browser will load proprietary code from their servers. Do you want to continue?";
	if(confirm(warning)) {
		loadExternalJS("https://checkout.stripe.com/checkout.js", checkout);
	} else {
		document.getElementById("radPriceFree").click();
	}
}

function updateDownloadButtons(text, href) {
	var arrDownloadButtons = document.getElementsByClassName("rom-working");
	for(var c = 0; c < arrDownloadButtons.length; c++) {
		arrDownloadButtons[c].text = text;
		if(href == "value") {
			arrDownloadButtons[c].href = arrDownloadButtons[c].getAttribute("value");
		} else {
			arrDownloadButtons[c].href = href;
		}
	}
}

document.addEventListener("DOMContentLoaded", function(event) {
	//Handle radio buttons
	var arrRadPrice = document.getElementsByName("radPrice");
	for(var c = 0; c < arrRadPrice.length; c++) {
		arrRadPrice[c].onclick = function() {
			if(this.id=='radPriceFree') {
				updateDownloadButtons("Download", "value");
			} else {
				updateDownloadButtons("Purchase", "javascript:checkoutProxy()");
			}
		}
	}

	//Unhide
	document.getElementById("nameYourPrice").classList.remove("hidden");
	//Set default
	document.getElementById("radPriceTen").click();
});
