var paymentDescription = 'DivestOS Download Donation';

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

function checkoutUserDeclined() {
	document.getElementById("radPriceFree").click();
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
