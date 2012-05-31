here = File.expand_path(File.dirname __FILE__)
require "#{here}/spec_helper"

require "rspec_code"

describe RspecCode do

  # RSpecCode doesn't like to run from inside RSpec.
  # So we spawn a process and check its result.

  unless ENV["TEAMCITY_RAKE_RUNNER_MODE"]
    it "works when run from a standalone test" do
      require 'open3'
      Open3.popen3("ruby rspec_code_test.rb", :chdir => "#{here}/../test") {|stdin, stdout, stderr, wait_thr|
        pid = wait_thr.pid # pid of the started process.
        exit_status = wait_thr.value # Process::Status object returned.
        puts stdout.read.gsub(/^/, "stdout:\t\\1")
        puts stderr.read.gsub(/^/, "stderr:\t\\1")
        status = exit_status.exitstatus  # ROFL
        unless status == 0
          d { status }
          assert { status == 0 }
        end
      }
    end
  end
end
