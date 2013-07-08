def reverser
  yield.gsub(/\w+/) { |w| w.each_char.to_a.reverse.join }
end

def adder(x = 1)
  yield + x
end

def repeater(x = 1)
  x.times { yield }
end
