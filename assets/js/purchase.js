var paymentAmount = 0;

function checkout() {
	var paymentDescription = 'DivestOS Device Donation'
	var handler = StripeCheckout.configure({
		key: 'pk_live_51IoDKvI3AVrWM0J0G0vPOlLifd4QLgVLQ2U4ExmBr7bhIclNwS3docWLwPSMCb2GdaZIDcj1mwoD6xSAMW8azhSU00ShMorJp4',
		locale: 'auto',
		allowRememberMe: false,
		token: function(token) {
			var req = new XMLHttpRequest();
			req.onreadystatechange = function() {
				if (req.readyState == 4 && req.status == 200) {
					setTimeout(markDonated, 500);
				}
			};
			req.open("POST", "sbnr/stripe.php", true);
			req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			req.send("PAYMENT_TOKEN=" + token.id
			+ "&PAYMENT_AMOUNT=" + paymentAmount
			+ "&PAYMENT_DESCRIPTION=" + btoa(paymentDescription)
			+ "&CSRF_TOKEN=" + getCSRFToken());
		}
	});

	handler.open({
		name: 'Divested Computing Group',
		description: paymentDescription,
		zipCode: true,
		amount: paymentAmount
	});

	window.addEventListener('popstate', function() {
		handler.close();
	});
}

function markDonated() {
	document.getElementById("lblThanks").hidden = false;
	document.getElementById("radPriceOne").disabled = true;
	document.getElementById("radPriceFive").disabled = true;
	document.getElementById("radPriceTen").disabled = true;
	document.getElementById("radPriceFifteen").disabled = true;
	document.getElementById("radPriceFree").click();
	document.getElementById("lblPriceFree").textContent = "Donated";
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
				paymentAmount = 0;
				updateDownloadButtons("Download", "value");
			} else if(this.id=='radPriceOne') {
				paymentAmount = 100;
				updateDownloadButtons("Donate", "javascript:checkoutProxy()");
			} else if(this.id=='radPriceFive') {
				paymentAmount = 500;
				updateDownloadButtons("Donate", "javascript:checkoutProxy()");
			} else if(this.id=='radPriceTen') {
				paymentAmount = 1000;
				updateDownloadButtons("Donate", "javascript:checkoutProxy()");
			} else if(this.id=='radPriceFifteen') {
				paymentAmount = 1500;
				updateDownloadButtons("Donate", "javascript:checkoutProxy()");
			}
		}
	}

	//Unhide
	document.getElementById("nameYourPrice").classList.remove("hidden");
	//Set default
	document.getElementById("radPriceFive").click();
});
