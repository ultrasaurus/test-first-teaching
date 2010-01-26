require 'converter.rb'

describe Converter do
  before do
    @converter = Converter.new
  end

  it "converts # to h1" do
    @converter.markdown = <<EOS
# heading
EOS
    @converter.textile.should == "h1. heading\n"
  end

    it "should not convert # to in the middle of line" do
    @converter.markdown = <<EOS
We are #1!
EOS
    @converter.textile.should == "We are #1!\n"
  end

    it "converts ## to h2" do
    @converter.markdown = <<EOS
## heading
EOS
    @converter.textile.should == "h2. heading\n"
  end

    it "converts ### to h3" do
    @converter.markdown = <<EOS
### heading
EOS
    @converter.textile.should == "h3. heading\n"
  end

     it "converts different kinds of headings" do
    @converter.markdown = <<EOS
# top level heading
Here is a line without a heading
## second level
Another line with a # in it!
## another second
### thir
# top level again
EOS

    @converter.textile.should ==  <<EOS
h1. top level heading
Here is a line without a heading
h2. second level
Another line with a # in it!
h2. another second
h3. thir
h1. top level again
EOS

  end

    it "converts links" do
    @converter.markdown = <<EOS
Here is a ![alt-text](link)
EOS

    @converter.textile.should == "Here is a !link!\n"
  end
 
    it "converts images in a block of text with special chars" do
    @converter.markdown = <<EOS
Here is a ![alt-text](link) in a block of text (which has [special] chars!)
EOS

    @converter.textile.should == "Here is a !link! in a block of text (which has [special] chars!)\n"
  end
end
