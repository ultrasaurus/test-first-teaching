function Calculator() {
	this.stack = [0];
};

Calculator.prototype = {
	value: function() {
		return this.stack[this.stack.length - 1];
	},
	
	add: function(x) {
		this.push(x);
		this.plus();
	},
	
	subtract: function(x) {
		this.push(x);
		this.minus();
	},
	
	push: function(value) {
		this.stack.push(value);
	},
	
  plus: function() {
		this.stack.push(this.pop() + this.pop());
	},
	
  minus: function() {
		var second = this.pop();
		var first = this.pop();
		this.stack.push(first - second);
	},

  times: function() {
		this.stack.push(this.pop() * this.pop());
	},
	
  divide: function() {
		var second = this.pop();
		var first = this.pop();
		this.stack.push(first / second);
	},
	
	pop: function() {
		var value = this.stack.pop();
		if (typeof(value) == 'undefined') {
			throw "calculator is empty";
		}
		return value;
	},
	
	END: null
};
