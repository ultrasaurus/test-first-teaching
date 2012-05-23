here = File.expand_path File.dirname(__FILE__)
require "#{here}/spec_helper"

require "#{here}/../app"
require "rack/test"

describe Sinatra::Application do
  include Rack::Test::Methods

  def get! *args
    get *args
    assert { last_response.status == 200 }
  end

  def app
    @app ||= Sinatra::Application.new
  end

  it "loads the main site pages" do
    get! "/"
    assert { last_response.body =~ /<title>TestFirst.org/}
    get! "/about"
    get! "/learn_ruby"
    get! "/learn_javascript"
  end

  describe "interactive page" do
    it "loads with no parameters" do
      get! "/live"
    end
  end
end
