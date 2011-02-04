function Temperature(degreesFahrenheit) {
	this.fahrenheit = function() {
		return degreesFahrenheit;
	}
	this.celcius = function() {
		return (degreesFahrenheit-32) * (5.0/9.0);    
	}
	this.setFahrenheit = function(f) {
		degreesFahrenheit = f;
	}
	this.setCelcius = function(c) {
		degreesFahrenheit = c * (9.0/5.0) + 32;
	}
}

function f2c(f) {
  return (f-32) * (5.0/9.0)
}
  
function c2f(c) {
  return c * (9.0/5.0) + 32
}
