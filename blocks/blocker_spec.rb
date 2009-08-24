require "blocker"

describe Blocker do
  it "executes a block and returns the value" do
    Blocker.execute do
      5
    end.should == 5
  end

  it "works with braces too" do
    Blocker.execute { 5 }.should == 5
  end

  it "adds one to the value returned by the block" do
    Blocker.add_one do
      5
    end.should == 6
  end

  it "passes a value in to the block" do
    x = nil
    Blocker.receive(3) do |value|
      x = value
    end
    x.should == 3
  end
end
