class Machine

  def do_something(count=1)
    x = 0
    count.times do
      x = yield
    end
    x
  end


end
