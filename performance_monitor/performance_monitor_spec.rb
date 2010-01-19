require 'performance_monitor'

describe PerformanceMonitor do
  it "executes a block" do
    n = nil
    PerformanceMonitor.new.execute do
      n = 7
    end
    n.should == 7
  end

  it "executes a block N times" do
    n = 0
    PerformanceMonitor.new.execute(4) do
      n += 1
    end
    n.should == 4
  end
  
  describe "Time stub" do
    it "should increment mock_time by 10 seconds" do
      fake_time = 0 
      Time.stub!(:now).and_return { fake_time += 10 }
      Time.now.should == 10
      Time.now.should == 20
    end
  end

  it "returns the elapsed time" do
    n = 0 
    fake_time = 0 
    Time.stub!(:now).and_return { fake_time += 10 }
    average_run_time = PerformanceMonitor.new.execute(4) do
      n += 1
    end
    n.should == 4
    average_run_time.should == 10
  end


end



