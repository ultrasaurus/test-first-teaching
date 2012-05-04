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
    @safe_level = 0  # todo: bump it up
  end

  def safe
    "$SAFE = #{@safe_level}; nil;\n"
  end

  def cmd
    safe + @source
  end

  class BindingPantry
    def self.fresh_binding
      BindingPantry.new.create_block.binding
    end

    def create_block
      Proc.new {}
    end
  end

  def fresh_binding
    BindingPantry.fresh_binding
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
        Thread.new {
          binding = fresh_binding
          eval cmd, binding, "CODE", 1
        }.value
      }
    rescue Exception => e
      error = e
    ensure
      $stdout, $stderr = old_stdout, old_stderr
      # FakeFS.deactivate!
    end

    if error
      puts "\t" + error.backtrace.join("\n\t") if @rspec  # todo: better logging
      error.backtrace.first =~ /^<main>:(\d+):/
      line = $1.to_i
      out[:error] = {:class => e.class.name, :message => e.message, :line => line}
    end

    out[:result] = result if result
    out[:stdout] = captured_stdout.string unless captured_stdout.string == ""
    out[:stderr] = captured_stderr.string unless captured_stderr.string == ""

    process_output(out)

    puts out.to_json  # todo: more formal logging

    out
  end

  def process_output(out)
  end

end
