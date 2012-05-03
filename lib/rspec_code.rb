require 'timeout'
require 'json'
# require 'fakefs'
require 'files'
require 'rspec/core'

require 'code'

class RspecCode < Code

  NOTHING = <<-RUBY
describe 'nothing' do
  it 'happens' do
  end
end
  RUBY

  def self.prime
    new("", :rspec => NOTHING).run
  end

  def initialize(source, options = {})
    super
    @rspec = options[:rspec]
  end

  def cmd
    # file "source.rb", @source
    file "spec.rb", <<-RUBY
RSpec.world.reset
RSpec.configuration.output_stream = nil
RSpec.configuration.mock_with :rspec
RSpec.configuration.expect_with :rspec

#{safe}
include RSpec::Core::DSL
describe "test:" do
  #{@source}
  #{@rspec}
end
    RUBY
    cmd = "RSpec::Core::Runner.run(%w(--format RSpec::Core::Formatters::JsonFormatter #{@files.root}/spec.rb));"
   end

   def process_output(out)
    if out[:stdout]
      out[:rspec_results] = JSON.parse(out[:stdout])
    end
  # to unhide exceptions that rake --trace hides the class of
  # rescue Exception => e
  #   p e
  #   raise e
  rescue JSON::ParserError
    # nevermind - if the output is unparseable, just leave it in stdout
  end

end
