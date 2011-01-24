describe("rgb", function() {
	it("converts the black hex code", function() {
		expect(rgb("#000000")).toEqual([0, 0, 0]);		
	});
	it("converts the white hex code", function() {
		expect(rgb("#FFFFFF")).toEqual([255, 255, 255]);
	});
	it("ignores case", function() {
		expect(rgb("#ffffff")).toEqual([255, 255, 255]);
	});
	it("converts a trivial hex code", function() {
		expect(rgb("#010203")).toEqual([1, 2, 3]);
	});
	it("converts some arbitrary hex codes", function() {		
		expect(rgb("#123456")).toEqual([18, 52, 86]);
		expect(rgb("#CAFE18")).toEqual([202, 254, 24]);
		expect(rgb("#22BEEF")).toEqual([34, 190, 239]);
	});
});

describe("hex", function() {
	it("converts the black rgb code", function() {
		expect(hex([0,0,0])).toEqual("#000000");
	});
	it("converts the white hex code", function() {
		expect(hex([255,255,255])).toEqual("#FFFFFF");
	});
	it("converts a trivial rgb code", function() {
		expect(hex([1,2,3])).toEqual("#010203");
	});
	it("converts an arbitrary rgb code", function() {
		expect(hex([202, 254, 24])).toEqual("#CAFE18");
	});
});

