# require "rubygems"
# require "rspec"

class Calculator
  def add(*args)
    args.inject(0){|sum, x| sum+x}
  end
end


describe Calculator do
  it "adds 2 and 2" do
    Calculator.new.add(2,2).should == 4
  end

  it "adds positive numbers" do
    Calculator.new.add(2,6).should == 8
  end


  it "adds several numbers" do
    Calculator.new.add(2,6,4,8).should == 18
  end
end

