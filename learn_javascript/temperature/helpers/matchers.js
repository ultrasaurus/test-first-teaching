beforeEach(function() {
  this.addMatchers({
    toBeCloseTo: function(expected, precision) {
			precision = precision || 2;
			var multiplier = Math.pow(10, precision);			
			var actual = Math.round(this.actual * multiplier);
			expected = Math.round(expected * multiplier);
			return expected == actual;
    }
  })
});
