//requires https://github.com/sindresorhus/devtools-detect
window.addEventListener('devtoolschange', function (e) {
	if(e.detail.open) {
		console.clear();
		console.log("%cWARNING: UNAUTHORIZED COPYING OF CONTENT FROM THIS SITE IS STRICTLY PROHIBITED", "font: 3em sans-serif; color: #f44336; background-color: #212121;");
	}
});
window.addEventListener("keydown", function(e) {//Credit: https://stackoverflow.com/a/38359924
	if (e.code == "F12") {
		e.preventDefault(); e.stopPropagation(); return false;
	}
	if (e.getModifierState("Control")  && e.code == "KeyU") {
		e.preventDefault(); e.stopPropagation(); return false;
	}
	if (e.getModifierState("Control") && e.getModifierState("Shift") && event.code == "KeyI") {
		e.preventDefault(); e.stopPropagation(); return false;
	}
	if (e.getModifierState("Control") && e.getModifierState("Shift") && event.code == "KeyK") {
		e.preventDefault(); e.stopPropagation(); return false;
	}
});
