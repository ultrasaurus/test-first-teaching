require 'simon'

describe Simon do
  
  it "can echo hello" do
    Simon.new.echo("hello").should == "hello"
  end
  
  it "can echo bye" do
    Simon.new.echo("bye").should == "bye"
  end

  it "can shout hello" do
    Simon.new.shout("hello").should == "HELLO"
  end
  
  it "can shout multiple words" do
    Simon.new.shout("hello world").should == "HELLO WORLD"
  end

  it "can repeat" do
    Simon.new.repeat("hello").should == "hello hello"
  end

  it "can repeat a number of times" do
    Simon.new.repeat("hello", 3).should == "hello hello hello"
  end
end
