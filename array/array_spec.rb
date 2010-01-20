require "array_extension"

describe Array do
  before do
    @my_array = [1,2,4]
  end

  describe "#sum" do
    it "should add all of the elements" do
      @my_array.sum.should equal 7

    end
  
  end

end
