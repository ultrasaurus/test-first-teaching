require "#{File.dirname(__FILE__)}/hello"

describe Hello do
  it "says hello" do
    Hello.new.message.should == "hello"
  end
end
