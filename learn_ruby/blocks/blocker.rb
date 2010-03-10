class Blocker
  def execute(n=1)
    s = nil
    n.times do
      s = yield
    end
    s
  end
  
  def add_one
    x = yield
    x+1
  end
end
