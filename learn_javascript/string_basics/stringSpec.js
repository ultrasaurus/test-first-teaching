describe ("fun with strings", function() {
  
  it ("should echo hello", function() {
    expect(echo("hello")).toEqual("hello")
  });
  
  it ("should echo bye", function() {
    expect(echo("bye")).toEqual("bye")
  });

  it ("should shout hello", function() {
    expect(shout("hello")).toEqual("HELLO")
  });
  
  it ("should shout multiple words", function() {
    expect(shout("hello world")).toEqual("HELLO WORLD")
  });

  it ("should repeat", function() {
    expect(repeat("hello")).toEqual("hello hello")
  });

  it ("should repeat a number of times", function() {
    expect(repeat("hello", 3)).toEqual("hello hello hello")
  });

  it ("should return the first letter", function() {
    expect(start_of_word("hello", 1)).toEqual("h")
  });
  
  it ("should return the first two letters", function() {
    expect(start_of_word("Bob", 2)).toEqual("Bo")
  });

  it ("should tell us the first word of 'Hello World' is 'Hello'", function() {
    expect(first_word("Hello World")).toEqual("Hello")
  });

  it ("should tell us the first word of 'oh dear' is 'oh'", function() {
    expect(first_word("oh dear")).toEqual("oh")
  });
  
});
