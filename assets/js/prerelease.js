var message = "DivestOS is currently in pre-release stage.\n\nPlease for the time being DO NOT share this site, the available builds, or the code with anyone. We have spent a lot of time working on this project and we want to release it with a splash. Furthermore dedicated mirror servers have not been setup and this current server would not be able to handle a large influx of users.\n\nThanks for your support and interest. We hope to release soon!\n\nClick 'OK' to prevent this message from showing again.";
var confirmed = "PreReleaseConfirmed";

if(getCookie(confirmed) != "YES") {
	if(confirm(message)) {
		setCookie(confirmed, "YES", 2);
	}
}

//CREDIT: https://www.w3schools.com/js/js_cookies.asp
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

//CREDIT: https://www.w3schools.com/js/js_cookies.asp
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
