require 'dictionary'

describe Dictionary do
  it "should be empty when created" do
    d = Dictionary.new
    d.words == []
  end

  it "should report its contents" do 
    d = Dictionary.new
    d.add("fish")
    d.add("foul")
    d.words.sort == ["fish", "foul"].sort
  end

  it "should not include a word in an empty dictionary" do
    d = Dictionary.new
    d.include?('fish').should be_false
  end

  it "should be able to add words" do
    d = Dictionary.new
    d.add('fish')
    d.include?('fish').should be_true
  end

  it "should not find word in empty dictionary" do
    d = Dictionary.new
    d.find('fi').should == []
  end

  it "should find a word from a prefix" do
    d = Dictionary.new
    d.add('fish')
    d.add('fiend')
    d.add('great')
    d.find('gr').should == ['great']
  end

  it "should find multiple matches from a prefix" do
    d = Dictionary.new
    d.add('fish')
    d.add('fiend')
    d.add('great')
    d.find('fi').sort.should == ['fish', 'fiend'].sort
  end
end

