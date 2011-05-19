class Friend
  def greeting(who = nil)
    if who
      "Hello, #{who}!"
    else
      "Hello!"
    end
  end
end
