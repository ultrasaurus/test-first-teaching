here = File.expand_path File.dirname(__FILE__)
require "#{here}/spec_helper"

require "#{here}/../app"
require "rack/test"

# todo: use a dummy set of sites instead of the real "installfest" and "curriculum"

describe Sinatra::Application do
  include Rack::Test::Methods

  # def app
  #   @app ||= InstallFest.new
  # end
  #
  # # find the actual InstallFest app, discarding Rack middleware
  # def true_app
  #   true_app = app
  #   until true_app.is_a? InstallFest
  #     next_app = true_app.instance_variable_get(:@app)
  #     break if next_app.nil?
  #     true_app = next_app
  #   end
  #   true_app
  # end
  #
  # it "is a sinatra app" do
  #   assert { true_app.is_a? InstallFest }
  #   assert { true_app.class.ancestors.include? Sinatra::Application }
  # end

  it "runs" do

  end
end
