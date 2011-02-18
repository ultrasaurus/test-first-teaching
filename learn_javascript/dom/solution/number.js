Number.prototype.toHex = function() {
	var hex = this.toString(16);
	if (hex.length == 1) {
		hex = "0" + hex;
	}
	return hex;
}
