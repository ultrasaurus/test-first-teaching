# from https://github.com/Sophrinix/TryRuby/blob/master/lib/tryruby.rb

# run something
FakeFS.activate!
stdout_id = $stdout.to_i
$stdout = StringIO.new
cmd = <<-EOF
#{SetupCode}
$SAFE = 3
#{session.past_commands}
$stdout = StringIO.new
begin
  #{session.current_statement}
  #{code}
end
EOF
begin
  result = Thread.new { eval cmd, TOPLEVEL_BINDING }.value
rescue SecurityError
  return Output.illegal
rescue Exception => e
  return Output.error :error => e, :output => get_stdout
ensure
  output = get_stdout
  $stdout = IO.new(stdout_id)
  FakeFS.deactivate!
end
