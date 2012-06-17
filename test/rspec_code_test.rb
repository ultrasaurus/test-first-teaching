require 'wrong'
include Wrong
require 'files'
include Files

here = File.expand_path(File.dirname __FILE__)
require "#{here}/test_helper"

require "rspec_code"

Wrong.config.verbose
Wrong.config.color

print "Priming... "
$stdout.flush
RspecCode.prime
puts "primed."

def run_rspec source, spec = nil
  RspecCode.new(source, :rspec => spec).run
end

# wipes the scope between runs
spec = <<-RUBY
describe 'x' do
  it 'is 7' do
    x.should == 7
  end
end
RUBY

answer = run_rspec("def x; 7; end", spec)
assert { answer[:rspec_results]["summary"]["failure_count"] == 0 }
answer = run_rspec("", spec)
assert { answer[:rspec_results]["summary"]["failure_count"] == 1 }

# works with rspec
2.times do
  spec = <<-RUBY
  describe 'add' do
    it 'adds' do
      add(2,3).should == 5
    end
  end
  RUBY
  source = <<-RUBY
  def add(x, y)
    x + y
  end
  RUBY

  answer = run_rspec(source, spec)

  # test_results = JSON.parse(answer[:stdout])
  rspec_results = answer[:rspec_results]
  assert { rspec_results["summary"] }
  assert { rspec_results["summary"]["example_count"] == 1 }
  assert { rspec_results["summary"]["failure_count"] == 0 }
end

# captures exceptions inside rspec
spec = "raise 'oops'"
source = ""
answer = run_rspec(source, spec)
answer.delete(:stdout)
assert { answer == {:error => {:class => "RuntimeError", :message => "oops",
  :line => 0  # todo: fix line number
  }}}

# splits out stdout, stderr, and test results
spec = <<-RUBY
  describe 'add' do
    it 'adds' do
      add(2,3).should == 5
    end
  end
RUBY
source = <<-RUBY
  def add(x, y)
    puts "x is \#{x}"
    $stderr.puts "y is \#{y}"
    x + y
  end
RUBY

answer = run_rspec(source, spec)
assert { answer[:stdout] == "x is 2\n" }
rspec_results = answer[:rspec_results]
assert { rspec_results["summary"] }
assert { rspec_results["summary"]["example_count"] == 1 }
assert { rspec_results["summary"]["failure_count"] == 0 }
