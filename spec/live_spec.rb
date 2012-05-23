here = File.expand_path File.dirname(__FILE__)
require "#{here}/spec_helper"
require "live"

describe Live do
  let(:course){Course.new("learn_ruby")}
  it "renders" do
    Live.new(:course => course).to_html
  end
end