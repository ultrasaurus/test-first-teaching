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
		jasmineContent.innerHTML = "<div id='arena' style='position:relative; width: 400px; height: 300px'></div>";
		// create a simple object for testing
		arena = document.getElementById("arena");
		ball = new BouncingBall(arena);
	});
	
	// helper method to dry up accessing ball's x position
	function ball_x(){
    //return parseInt(ball.div.style.left);
  }
  
  function ball_y(){
    return parseInt(ball.div.style.top);
  }
	
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
		
		it("has a velocity", function(){
		  expect(ball.velocity).toEqual(10);
		});
		
		it("moves", function(){
		  var velocity = ball.velocity;
		  var start_x = ball.div.style.left;
		  var end_x = parseInt(start_x) + velocity + "px";
		  ball.move();
		  expect(ball.div.style.left).toEqual(end_x);
		});
		
	})
	
	describe("when running", function() {
		
		var velocity, wait;
		
		beforeEach(function(){
		  jasmine.Clock.useMock();
      velocity = ball.velocity;
      wait = ball.frame_duration;
		});
		
		it("sets a timeout to move again", function(){
      expect( ball_x() ).toEqual( 0 );
      
      ball.move();
      expect( ball_x() ).toEqual( 1 * velocity );
      
      jasmine.Clock.tick( wait );
      expect( ball_x() ).toEqual( 2 * velocity );
      
      jasmine.Clock.tick( wait );
      expect( ball_x() ).toEqual( 3 * velocity );
		});
		
		it("stays within the arena", function(){
		  // put ball at lower right edge of arena
		  ball.x = arena.offsetWidth - ball.width;
      ball.y = arena.offsetHeight - ball.height;
      
		  ball.move();
		  
		  // ball should have bounced off of the right edge
      expect( ball_x() ).toBeLessThan( parseInt( arena.offsetWidth ) );
      expect( ball_y() ).toBeLessThan( parseInt( arena.offsetHeight ) );
		});

		it("can be destroyed", function(){
		  ball.destroy();
		  expect(ball.div.parentNode).toBeNull();
		});
		
		it("can be stopped", function(){
      expect(ball_x()).toEqual( 0 );
      
      ball.move();
      ball.stop();
      expect(ball_x()).toEqual( 1 * velocity);
      
      jasmine.Clock.tick( wait );
      expect(ball_x()).toEqual( 1 * velocity );
      
      jasmine.Clock.tick( wait );
      expect(ball_x()).toEqual( 1 * velocity );
		  
		});
		
		it("can be started", function(){
      expect(ball_x()).toEqual( 0 );
      
      ball.move();
      ball.stop();
      expect(ball_x()).toEqual( 1 * velocity);
      
      jasmine.Clock.tick( wait );
      expect(ball_x()).toEqual( 1 * velocity );

      ball.start();
      jasmine.Clock.tick( wait );
      expect(ball_x()).toEqual( 2 * velocity );
      
      jasmine.Clock.tick( wait );
      expect(ball_x()).toEqual( 3 * velocity );
		});
	})
});
