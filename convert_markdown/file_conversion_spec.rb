require 'format_independent_textfile'

describe FormatIndependentTextfile do
  before do
    File.should_not exist "test.text"
    File.should_not exist "test.markdown"
  end

  after do
    `rm test.*` 
  end

  it "should act like a file" do
    fname = "test.text"
    FormatIndependentTextfile.open(fname, "w") do |f|
      f << "here is some text"
    end

    File.should exist fname
    File.read(fname).should == "here is some text"
    
  end

  it "should return textile for first level heading" do
    FormatIndependentTextfile.open("test.markdown", "w+") do |f|
      f << "# this is a heading\n"

      f.textile.should == <<EOS
h1. this is a heading
EOS
    end
  end

    it "should return textile for first and second headings" do
    FormatIndependentTextfile.open("test.markdown", "w+") do |f|
      f << "# this is a heading\n"
      f << "## this is a second level heading\n"

      f.textile.should == <<EOS
h1. this is a heading
h2. this is a second level heading
EOS
    end
  end
end
