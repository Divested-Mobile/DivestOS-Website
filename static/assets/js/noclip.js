window.addEventListener("keydown", function(e) {//Credit (CC BY-SA 3.0): https://stackoverflow.com/a/38359924
	if (e.getModifierState("Control")  && e.code == "KeyC") {
		e.preventDefault(); e.stopPropagation(); return false;
	}
	if (e.getModifierState("Control")  && e.code == "KeyX") {
		e.preventDefault(); e.stopPropagation(); return false;
	}
	if (e.getModifierState("Control")  && e.code == "KeyS") {
		e.preventDefault(); e.stopPropagation(); return false;
	}
});
