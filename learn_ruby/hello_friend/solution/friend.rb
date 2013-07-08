class Friend
  def greeting(x=nil)
    if x == nil
      "Hello!"
    else
      "Hello, #{x}!"
    end
  end
end
