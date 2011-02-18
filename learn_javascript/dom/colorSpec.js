describe("Color", function() {
	it("is constructed with red, green, and blue values", function() {
		var color = new Color(1,2,3);
		expect(color.red).toEqual(1);
		expect(color.green).toEqual(2);
		expect(color.blue).toEqual(3);
	});
	
	it("can emit a hex value", function() {
		expect(new Color(0,0,0).toHex()).toEqual("#000000");
		expect(new Color(255,255,255).toHex()).toEqual("#ffffff");
		expect(new Color(60,70,80).toHex()).toEqual("#3c4650");
	});
	
	describe("gradient", function() {
		var black = new Color(0,0,0);
		var white = new Color(255,255,255);

		it("can calculate the midpoint of two colors", function() {
			var gray = black.gradient(white, 0.5);
			expect(gray.toHex()).toEqual("#7f7f7f");
		});

		it("can calculate an arbitrary point between two colors", function() {
			var gray = black.gradient(white, 0.1);
			expect(gray.toHex()).toEqual("#191919");
		});

		it("works if the colors are reversed", function() {
			var gray = white.gradient(black, 0.1);
			expect(gray.toHex()).toEqual("#e5e5e5");
		});

		it("hits the minimum color at 0 distance", function() {
			var min = black.gradient(white, 0);
			expect(min.toHex()).toEqual("#000000");
		});

		it("hits the maximum color at 1.0 distance", function() {
			var max = black.gradient(white, 1.0);
			expect(max.toHex()).toEqual("#ffffff");
		});

		it("hits the minimum color at negative distance", function() {
			var min = black.gradient(white, -0.5);
			expect(min.toHex()).toEqual("#000000");
		});

		it("hits the maximum color at greater than 1 distance", function() {
			var max = black.gradient(white, 1.5);
			expect(max.toHex()).toEqual("#ffffff");
		});

	});
	
});
