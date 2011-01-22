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
	});
		
});
