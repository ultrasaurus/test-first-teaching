describe("Number", function() {
	describe("toHex", function() {
		it("can convert a number to its hex representation", function() {
			expect((0).toHex()).toEqual("00");
			expect((1).toHex()).toEqual("01");
			expect((10).toHex()).toEqual("0a");
			expect((15).toHex()).toEqual("0f");
			expect((16).toHex()).toEqual("10");
			expect((255).toHex()).toEqual("ff");
		});
	});
});
