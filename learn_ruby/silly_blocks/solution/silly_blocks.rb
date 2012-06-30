def reverser
  yield.reverse
end

def adder num = 1
  yield + num
end

def repeater num = 1
  num.times do
    yield
  end
end

