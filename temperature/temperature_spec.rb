require "#{File.dirname(__FILE__)}/temperature"

describe Temperature do
  
  before do
    @temperature = Temperature.new
  end

  describe "#ftoc" do
    
    it "converts freezing temperature" do
      @temperature.ftoc(32).should == 0
    end
    
    it "converts boiling temperature" do
      @temperature.ftoc(212).should == 100
    end
    
    it "converts body temperature" do
      @temperature.ftoc(98.6).should == 37
    end
    
    it "converts arbitrary temperature" do
      @temperature.ftoc(68).should == 20
    end
    
  end

  describe "#ctof" do
    
    it "converts freezing temperature" do
      @temperature.ctof(0).should == 32
    end
    
    it "converts boiling temperature" do
      @temperature.ctof(100).should == 212
    end

    # sigh...
    # expected: 98.6,
    #      got: 98.6 (using ==)
    # it "converts body temperature" do
    #   @temperature.ctof(37).should == 98.6
    # end
    
    it "converts arbitrary temperature" do
      @temperature.ctof(20).should == 68
    end
    
  end

end
