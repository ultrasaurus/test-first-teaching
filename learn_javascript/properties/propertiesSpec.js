describe("Properties", function() {
	var object;
	
	beforeEach(function() {
	  object = {};
	  setSomePropertiesOn(object);
	});

	describe("setSomePropertiesOn", function() {
		it("sets x to 7", function() {
			expect(object.x).toEqual(7);
		});
		
		it("sets y to 8 (and we can use a string to access it)", function() {
			expect(object['y']).toEqual(8);
		});
		
		it("sets the property 'onePlus' to a function that adds one to its parameter", function() {
			expect(object.onePlus(4)).toEqual(5);
			expect(object['onePlus'](123)).toEqual(124);
		});
	});
});
