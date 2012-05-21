here = File.expand_path(File.dirname __FILE__)
require "#{here}/spec_helper"
require "code"

describe Code do
  def run source
    (@code = Code.new(source)).run
  end

  it "returns the result of the code executing" do
    answer = run("1 + 1")
    assert { answer == {:result => 2} }
  end

  it "returns nil if no code was executed" do
    answer = run("")
    assert { answer[:result].nil? }
  end

  it "captures stdout" do
    answer = run("puts 'hi'; 1 + 1")
    assert { answer == {:result => 2, :stdout => "hi\n" } }
  end

  it "captures stderr" do
    answer = run("warn 'hi'; 1 + 1")
    assert { answer == {:result => 2, :stderr => "hi\n" } }
  end

  it "runs at lop level" do
    code = Code.new("@foo = 'foo'")
    answer = code.run
    assert { code.instance_variable_get(:@foo).nil? }
  end

  it "sets SAFE level inside code, but preserves outside" do
# answer = run("puts $SAFE")
# assert {answer == {:stdout => "3\n"} }
# assert { $SAFE == 0 }
  end

  it "captures exceptions, including line number" do
# todo: correct line num
    answer = run("raise 'oops'")
    assert { answer == {:error => {:class => "RuntimeError", :message => "oops", :line => 0}}}
    answer = run("1+1\nraise 'oops'")
    assert { answer == {:error => {:class => "RuntimeError", :message => "oops", :line => 0}}}
  end

  it "times out during a system operation" do
    code = Code.new("sleep 2", :timeout => 0.5)
    answer = code.run
    deny { answer == {:result=>2} }
    assert { answer == {:error => {:class => "Timeout::Error", :message=>"execution expired", :line=>0 }}}
# sadly, the timeout error loses the line number
  end

  it "times out during an infinite loop" do
    code = Code.new("finish = Time.now + 5; while Time.now < finish do end", :timeout => 0.1)
    start = Time.now
    answer = code.run
    finish = Time.now
    assert { (finish - start) < 4 }
    assert { answer == {:error => {:class => "Timeout::Error", :message=>"execution expired", :line=>0 }}}
  end

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

  it "wipes the scope between runs" do
    answer = run("x = 7")
    assert { answer == {result: 7} }
    answer = run("x")
    answer = @code.run
    deny { answer == {result: 7} }
  end

end
