var jasmineContent;

describe("dom", function() {
	beforeEach(function() {		
		// set some fixture HTML inside the Jasmine runner page
		jasmineContent = document.getElementById("jasmine_content");
		jasmineContent.innerHTML = "pie";
	});
	it("reads HTML content from the test page", function() {
		expect(jasmineContent.innerHTML).toEqual("pie");
	});
});

