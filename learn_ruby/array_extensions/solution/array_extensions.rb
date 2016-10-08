
class Array
  def sum
      reduce(0, :+)
  end

  def square
    map{|n| n*n}
  end

  def square!
    map!{|n| n*n}
  end
end
