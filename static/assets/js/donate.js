var paymentDescription = 'DivestOS Donation';

function markDonated() {
	document.getElementById("nameYourPrice").classList.add("hidden");
	document.getElementById("lblThanks").hidden = false;
}

function checkoutUserDeclined() {
	//no-op
}

document.addEventListener("DOMContentLoaded", function(event) {
	//Handle radio buttons
	var arrRadPrice = document.getElementsByName("radPrice");
	for(var c = 0; c < arrRadPrice.length; c++) {
		arrRadPrice[c].onclick = function() {
			if(this.id=='radPriceOne') {
				paymentAmount = 100;
			} else if(this.id=='radPriceFive') {
				paymentAmount = 500;
			} else if(this.id=='radPriceTen') {
				paymentAmount = 1000;
			} else if(this.id=='radPriceFifteen') {
				paymentAmount = 1500;
			}
		}
	}

	//Unhide
	document.getElementById("nameYourPrice").classList.remove("hidden");
	//Set default
	document.getElementById("radPriceFive").click();
});
