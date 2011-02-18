function TemperatureWidget() {
	
	function f2c(f) {
	  return Math.round((f-32) * (5.0/9.0));
	}

	function c2f(c) {
	  return Math.round(c * (9.0/5.0) + 32);
	}	
	
	this.widgetElement = document.getElementById('temperatureWidget');
	
	var fahrenheit = this.widgetElement.getElementsByTagName('input')[0];	
	var celcius = this.widgetElement.getElementsByTagName('span')[0];
	var convertButton = this.widgetElement.getElementsByTagName('input')[1];	

	// stash away 'this' so we can access it inside a callback function
	var self = this;
	function convert() {
		var f = parseInt(fahrenheit.value);
		var c = f2c(f);
		celcius.innerHTML = c;
		self.widgetElement.style.backgroundColor = self.colorFor(c);
	}
	convertButton.onclick = convert;

	// expose private vars as public properties
	this.fahrenheit = fahrenheit;
	this.celcius = celcius;
	this.convertButton = convertButton;
	this.convert = convert;
}

TemperatureWidget.prototype.colorFor = function(celcius) {
	var freezing = new Color(208, 230, 254);
	var boiling = new Color(255, 50, 65);
	var distance = celcius / 100;
	return freezing.gradient(boiling, distance).toHex();
}
