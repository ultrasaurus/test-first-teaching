require "array_extension"

describe Array do
  before do
    @my_array1 = [1,2,4]
    @my_array2 = [1,3,5,7,9,11]
  end

  describe "#sum" do
    it "should add all of the elements" do
      @my_array1.sum.should equal 7
      @my_array2.sum.should equal 36
    end
  
  end

end
