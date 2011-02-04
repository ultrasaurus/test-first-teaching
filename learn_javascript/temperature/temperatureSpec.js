// These Temperature exercises progress through three stages:
// 1. Two functions, f2c and c2f, that demonstrate the simple equations for converting between fahrenheit and celcius degrees
// 2. An object, Temperature, that encapsulates the temperature value
// 3. Making sure that object uses *private data* (and privileged methods) instead of public properties to store the value

describe("Temperature", function() {
	describe("f2c", function() {
    it("converts freezing temperature", function() {
			expect(f2c(32)).toEqual(0);
		});
	
    it("converts boiling temperature", function() {
			expect(f2c(212)).toEqual(100);
		});

    it("converts body temperature", function() {
			expect(f2c(98.6)).toEqual(37);
		});

    it("converts an arbitrary temperature", function() {
			expect(f2c(68)).toEqual(20);
		});
	});

	describe("c2f", function() {
    it("converts freezing temperature", function() {
			expect(c2f(0)).toEqual(32);
		});
	
    it("converts boiling temperature", function() {
			expect(c2f(100)).toEqual(212);
		});

    it("converts body temperature", function() {	
			expect(c2f(37)).toBeCloseTo(98.6);
			// Why do we need to use toBeCloseTo? 
			// To avoid floating point precision errors.
			// See http://en.wikipedia.org/wiki/Floating_point#Accuracy_problems
			// Try replacing "toBeCloseTo" with "toEqual" and see what happens.
		});

    it("converts an arbitrary temperature", function() {
			expect(c2f(20)).toEqual(68);
		});
	});
	
	describe("the Temperature object", function() {
		var temperature;
		beforeEach(function() {
			temperature = new Temperature();
		});
		
		it("stores degrees Fahrenheit", function() {
			temperature.setFahrenheit(32);
			expect(temperature.fahrenheit()).toEqual(32);
		});
		
		it("converts from Fahrenheit to Celcius", function() {
			temperature.setFahrenheit(32);
			expect(temperature.celcius()).toEqual(0);
		});
		
		it("stores degrees Celcius", function() {
			temperature.setCelcius(0);
			expect(temperature.celcius()).toEqual(0);
		});
		
		it("converts from Celcius to Fahrenheit", function() {
			temperature.setCelcius(0);
			expect(temperature.fahrenheit()).toEqual(32);
		});
		
		it("can be constructed with degrees Fahrenheit", function() {
			temperature = new Temperature(32);
			expect(temperature.celcius()).toEqual(0);
		});
		
		// Bonus refactoring: once the above specs pass, 
		// refactor the original f2c and c2f functions 
		// to use your new Temperature class.

		it("privately encapsulates its data", function() {
			var temperature;
			temperature = new Temperature(32);
			for (var property in temperature) {
				// This assures that there are no data values at all on the object, just methods
			  expect(typeof(temperature[property])).toEqual('function');
			}
		});
	});
});
