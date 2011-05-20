require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/translators/index" do

  it "should render welcome" do
    render   # by default renders what's in the describe
    response.should have_tag('h1', /welcome/ )
  end

  it "should render welcome in piglatin" do
    assigns[:language] = "piglatin"
    render   # by default renders what's in the describe
    response.should have_tag('h1', /elcomeway/ )
    response.should have_tag('p', /piglatin/ )
  end

  it "should render word param in piglatin" do
    assigns[:language] = "piglatin"
    assigns[:word] = "dog"
    render   # by default renders what's in the describe
    response.should have_tag('p', /ogday/ )
  end

end