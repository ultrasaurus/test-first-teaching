function Color(red, green, blue) {
	this.red = red;
	this.green = green;
	this.blue = blue;
}

Color.prototype = {
	constructor: Color,
	
	toHex: function() {
		return "#" + 
		this.red.toHex() + 
		this.green.toHex() + 
		this.blue.toHex();
	},
	
	gradient: function(otherColor, distance) {
		function pointBetween(a,b) {
			if (distance < 0) { distance = 0 };
			if (distance > 1) { distance = 1 };
			return Math.floor((b - a) * distance) + a;
		}
		return new Color(
			pointBetween(this.red, otherColor.red),
			pointBetween(this.green, otherColor.green),
			pointBetween(this.blue, otherColor.blue)
		);
	},
	
	cogito: "sum"
}
