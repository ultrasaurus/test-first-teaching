require 'timeout'
# require 'fakefs'
require 'files'
require 'rspec/core'
class Code

  include Files

  def initialize(source, options = {})
    @source = source
    @timeout = options[:timeout] || 30
    @rspec = options[:rspec]
  end

  def cmd
    safe = "$SAFE = 3; nil\n"
    cmd = if @rspec
      # file "source.rb", @source
      file "spec.rb", <<-RUBY
RSpec.world.reset
RSpec.configuration.mock_with :rspec
RSpec.configuration.expect_with :rspec

#{safe}
#{@rspec}
#{@source}
      RUBY
      "STDOUT.puts $SAFE; RSpec::Core::Runner.run(%w(--format documentation --drb #{@files.root}/spec.rb)); puts 'arg'"
    else
      safe + @source
    end
    cmd
  end

  def run
    out = {}
    result = nil
    error = nil
    old_stdout, old_stderr = $stdout, $stderr
    captured_stdout = StringIO.new
    captured_stderr = StringIO.new
    $stdout = captured_stdout
    $stderr = captured_stderr
    # FakeFS.activate!
    begin
      result = Timeout.timeout(@timeout) {
        # Timeout#timeout claims to run in a separate thread,
        # but this is apparently a lie,
        # since $SAFE is set in the calling thread,
        # so we run a thread inside timeout
        STDOUT.puts cmd
        Thread.new { eval cmd, TOPLEVEL_BINDING }.value
      }
    rescue Exception => e
      error = e
    ensure
      $stdout, $stderr = old_stdout, old_stderr
      # FakeFS.deactivate!
    end

    if error
      puts "\t" + error.backtrace.join("\n\t") if @rspec
      error.backtrace.first =~ /^<main>:(\d+):/
      line = $1.to_i
      out[:error] = {:class => e.class.name, :message => e.message, :line => line}
    end

    out[:result] = result if result

    out[:stdout] = captured_stdout.string unless captured_stdout.string == ""
    out[:stderr] = captured_stderr.string unless captured_stderr.string == ""

    STDOUT.puts out.to_json

    out
  end

end
