function loadExternalJS(url, callAfterLoad) {
	var tmpJS = document.createElement('script');
	tmpJS.type = "text/javascript";
	tmpJS.src = url;
	tmpJS.onload = callAfterLoad;
	document.body.appendChild(tmpJS);
}
