require 'timeout'
require 'json'
# require 'fakefs'
require 'files'
require 'rspec/core'

class Code

  include Files

  def initialize(source, options = {})
    @source = source
    @timeout = options[:timeout] || 30
    @rspec = options[:rspec]
    @safe_level = 3
  end

  def safe
    "$SAFE = #{@safe_level}; nil;\n"
  end

  def cmd
    # todo: split out RSpec subclass
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
      "RSpec::Core::Runner.run(%w(--format RSpec::Core::Formatters::JsonFormatter --drb #{@files.root}/spec.rb));"
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
        # STDOUT.puts cmd  # remember, STDOUT is always the original stream
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
  # workaround for spork
    elsif captured_stdout.string =~ /^Exception encountered:/
      result_lines = captured_stdout.string.split("\n")
      result_lines[0] =~ /Exception encountered: #<(\w*): (.*)>$/
      out[:error] = {:class => $1, :message => $2}
      result_lines[2] =~ /spec.rb:(\d*):/
      out[:error][:line] = $1.to_i - 6  # fudge factor for extra lines -- todo: use actual fake files
    end

    out[:result] = result if result
    out[:stdout] = captured_stdout.string unless captured_stdout.string == ""
    out[:stderr] = captured_stderr.string unless captured_stderr.string == ""

    puts out.to_json  # todo: more formal logging

    out
  end

end
