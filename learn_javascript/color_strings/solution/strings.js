function rgb(hex) {
	var rgb = [];
	for(var i=1; i<7; i+=2) {
		var code = hex.slice(i,i+2);
		var dec = parseInt(code,16);
		rgb.push(dec);
	}
	return rgb;
}

function hex(rgb) {
	var hex = "#";
	for (var i=0; i<rgb.length; ++i) {
		if (rgb[i] < 16) {
			hex += "0";
		}
		hex += rgb[i].toString(16).toUpperCase();
	}
	return hex;
}
