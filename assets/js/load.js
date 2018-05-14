function loadExternalJS(url, callAfterLoad, integrity) {
	var tmpJS = document.createElement('script');
	tmpJS.type = "text/javascript";
	tmpJS.src = url;
	if(integrity !== undefined) {
		tmpJS.integrity = integrity;
	}
	tmpJS.onload = callAfterLoad;
	document.body.appendChild(tmpJS);
}
