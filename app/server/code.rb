require 'timeout'
# require 'fakefs'

class Code
  def initialize(source, options = {})
    @source = source
    @timeout = options[:timeout] || 10
  end

  def run
    cmd = <<-RUBY
      $SAFE = 3
      #{@source}
    RUBY

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
        Thread.new { eval cmd, TOPLEVEL_BINDING }.value
      }
    rescue Exception => e
      error = e
    ensure
      $stdout, $stderr = old_stdout, old_stderr
      # FakeFS.deactivate!
    end

    if error
      # puts "\t" + error.backtrace.join("\n\t")
      error.backtrace.first =~ /^<main>:(\d+):/
      line = $1.to_i
      out[:error] = {:class => e.class.name, :message => e.message, :line => line}
    end

    out[:result] = result if result

    out[:stdout] = captured_stdout.string unless captured_stdout.string == ""
    out[:stderr] = captured_stderr.string unless captured_stderr.string == ""

    out
  end

end
