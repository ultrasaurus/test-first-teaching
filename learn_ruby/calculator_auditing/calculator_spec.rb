require "calculator"

describe Calculator do
  it "should have a default name" do
      Calculator.new.name.should == "no name"
  end
  it "should display number of calculations" do
    Calculator.new.num_calculations.should == 0
  end
  it "should add 0 + 0 and return 0" do
    Calculator.new.add(0,0).should == 0      
  end

  it "should add 1 + 3 and return 4" do
    pending
    Calculator.new.add(1,3).should == 4
  end

  it "should allow specifying a name when created" do
    pending
    c = Calculator.new("Cool Calculator")
    c.name.should == "Cool Calculator"
  end

  it "should increment the number of calculations" do
    pending
    c = Calculator.new
    c.add(1,1)
    c.num_calculations.should == 1
  end
end
