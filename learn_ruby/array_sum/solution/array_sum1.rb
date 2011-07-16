class Array
  def sum
    total = 0
    each {|n| total += n }
    total
  end
end
