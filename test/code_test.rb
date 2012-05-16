here = File.expand_path(File.dirname __FILE__)
require "#{here}/test_helper"
require "code"

def run source
  Code.new(source).run
end

# returns the result of the code executing
answer = run("1 + 1")
assert { answer == {:result => 2} }

# returns nil if no code was executed
answer = run("")
assert { answer[:result].nil? }

# captures stdout
answer = run("puts 'hi'; 1 + 1")
assert { answer == {:result => 2, :stdout => "hi\n" } }

# captures stderr
answer = run("warn 'hi'; 1 + 1")
assert { answer == {:result => 2, :stderr => "hi\n" } }

# runs at lop level
code = Code.new("@foo = 'foo'")
answer = code.run
assert { code.instance_variable_get(:@foo).nil? }

# sets SAFE level inside code, but preserves outside
# answer = run("puts $SAFE")
# assert {answer == {:stdout => "3\n"} }
# assert { $SAFE == 0 }

# captures exceptions, including line number
# todo: correct line num
answer = run("raise 'oops'")
assert { answer == {:error => {:class => "RuntimeError", :message => "oops", :line => 0}}}
answer = run("1+1\nraise 'oops'")
assert { answer == {:error => {:class => "RuntimeError", :message => "oops", :line => 0}}}

# times out during a system operation
code = Code.new("sleep 2", :timeout => 0.5)
answer = code.run
deny { answer == {:result=>2} }
assert { answer == {:error => {:class => "Timeout::Error", :message=>"execution expired", :line=>0 }}}
# sadly, the timeout error loses the line number

# times out during an infinite loop
code = Code.new("finish = Time.now + 5; while Time.now < finish do end", :timeout => 0.1)
start = Time.now
answer = code.run
finish = Time.now
assert { (finish - start) < 4 }
assert { answer == {:error => {:class => "Timeout::Error", :message=>"execution expired", :line=>0 }}}

# # times out during a math operation
# code = Code.new("999999**999999", :timeout => 1)
# start = Time.now
# answer = code.run
# finish = Time.now
# d { (finish - start) }
# assert { (finish - start) < 2 }
# assert { answer == {:error => {:class => "Timeout::Error", :message=>"execution expired", :line=>0 }}}

# # uses a fake file system
# # todo
# e = nil
# tempdir = dir "fake" do
#   code = Code.new <<-RUBY
#     File.new('foo.txt') {|f| f.write('foo')}
#     File.read('foo.txt')
#   RUBY
#   answer = code.run
# end
# assert { answer[:result] == "foo" }
# deny { File.exist? "#{tempdir}/foo.txt" }

# wipes the scope between runs
answer = run("x = 7")
assert { answer == {result: 7} }
answer = run("x")
answer = code.run
deny { answer == {result: 7} }

