/*
Here we are going to create a JS widget that makes a div bounce around inside another div.
Ultimately we will have many divs bouncing simultaneously; each will have its own object
that describes where it is at any moment, as well as other properties such as its size
and color.
*/

describe("BouncingBall", function() {
	var jasmineContent;
	var arena;
	var ball;
	
	beforeEach(function() {		
		// set some fixture HTML inside the Jasmine runner page
		jasmineContent = document.getElementById("jasmine_content");
		jasmineContent.innerHTML = "<div id='arena' style='position:relative'></div>";
		// create a simple object for testing
		arena = document.getElementById("arena");
		ball = new BouncingBall(arena);
	});
	
	describe("when created", function() {
		it("contains an 'element' property", function() {
			expect(ball.div).not.toBeUndefined();
			expect(ball.div instanceof HTMLElement).toBeTruthy();
			});		
		
		it("is a child of the arena", function() {
			expect(ball.div.parentNode).toEqual(arena);
		});
		
		it("has some default properties", function() {
			// see http://www.w3schools.com/jsref/dom_obj_style.asp#positioning
			expect(ball.height).toEqual(10);
			expect(ball.width).toEqual(10);
			expect(ball.x).toEqual(0);
			expect(ball.y).toEqual(0);
			expect(ball.color).toEqual("#FF0000");
		});
		
		it("sets those default properties on the div", function() {
			expect(ball.div.style.height).toEqual("10px");
			expect(ball.div.style.width).toEqual("10px");
			expect(ball.div.style.backgroundColor).toEqual("rgb(255, 0, 0)");
			expect(ball.div.style.left).toEqual("0px");
			expect(ball.div.style.top).toEqual("0px");
		});
		
		it("has a velocity");
		
		it("moves");
		
		it("sets a timeout to move again");

		it("can be destroyed");
		
		it("can be stopped");
		
		it("can be started");
	})
});
