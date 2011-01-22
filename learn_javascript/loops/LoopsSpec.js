describe("Loops", function() {
	describe("repeat", function() {
		it("is empty with 0 repeats", function() {
			expect(repeat("yo", 0)).toEqual("");
		});
		it("repeats its argument once", function() {
			expect(repeat("yo", 1)).toEqual("yo");
		});
		it("repeats its argument twice", function() {
			expect(repeat("yo", 2)).toEqual("yoyo");
		});
		it("repeats its argument many times", function() {
			expect(repeat("yo", 10)).toEqual("yoyoyoyoyoyoyoyoyoyo");
		});
	});
	
	describe("looping over arrays", function() {
	
		// try to implement this join() function without using the built-in String#join function
		describe("join", function() {
			it("turns an empty array into an empty string", function() {
				expect(join([])).toEqual("");
			});
		
			it("turns an array with one element into a string", function() {
				expect(join(['a'])).toEqual("a");
			});
		
			it("turns an array with many elements into a string", function() {
				expect(join(['apple', 'banana', 'cherry'])).toEqual("applebananacherry");
			});
		
			it("inserts a delimiter between elements", function() {
				expect(join(['apple', 'banana', 'cherry'], '/')).toEqual("apple/banana/cherry");
			});
		
			// This test is to make sure you don't use "for (var i in a)" on an array
			it("ignores non-indexed properties set on the array object", function() {
				var array = ['apple', 'banana', 'cherry'];

				array['type'] = 'fruits';
				expect(array.type).toEqual('fruits');

				array.first = function() { return this[0]; }
				expect(array.first()).toEqual('apple');

				expect(join(array)).toEqual("applebananacherry");
			});
		
		});
	
		describe("sum", function() {
		  it("computes the sum of an empty array", function() {
	      expect(sum([])).toEqual(0);
	    });
    
	    it("computes the sum of an array of one number", function() {
	      expect(sum([7])).toEqual(7);
	    });
    
	    it("computes the sum of an array of two numbers", function() {
	      expect(sum([7,11])).toEqual(18);
	    });
    
	    it("computes the sum of an array of many numbers", function() {
	      expect(sum([1,3,5,7,9])).toEqual(25);
	    });
		});
	});
	
	// hint: to loop over elements of a hash, you can use
	//  for (var key in hash) {}
	describe("looping over hashes", function() {
		describe("paramify", function() {
			it("works on an empty hash", function() {
				expect(paramify({})).toEqual("");
			});
			
			it("converts a hash with one element", function() {
				expect(paramify({size: 14})).toEqual("size=14");
			});
			
			it("converts a hash with two elements", function() {
				expect(paramify({height: 74, width: 12})).toEqual("height=74&width=12");
			});
			
			it("converts a hash with many elements", function() {
				var hash = {a:1,b:2,c:3,d:4,e:5,f:6}
				expect(paramify(hash)).toEqual("a=1&b=2&c=3&d=4&e=5&f=6");
			});
			
			// this one might be a bit tricky ;-)
			it("outputs the parameters in alphabetical order", function() {
				var hash = {f:6,e:5,d:4,c:3,b:2,a:1};
				expect(paramify(hash)).toEqual("a=1&b=2&c=3&d=4&e=5&f=6");
			});
			
			// Advanced. Change "xit" to "it" to run this test.
			xit("skips properties of the object's prototype", function() {
				var Alphabet = function() { 
					this.a = 1;
					this.b = 2;
				}
				Alphabet.prototype = {c: 3};
				expect(paramify(new Alphabet())).toEqual("a=1&b=2");
			});
		});
  });	
	
	// Test-Driving Bonus: once the above tests pass, 
  // write tests and code for the following.
  // See http://en.wikipedia.org/wiki/Factorial
  // You can either use iteration (loops) or recursion. 
  // (Recursion is easier, but might blow your mind.)
  describe("factorial", function() {
    it("computes the factorial of 0");
    it("computes the factorial of 1");
    it("computes the factorial of 2");
    it("computes the factorial of 5");
    it("computes the factorial of 10");
  });
  
});
