class Array
  def sum
    result = 0
    self.each do |x| 
      result += x
    end
    result
  end

  def square
    return self unless !empty?
    self.map { |x| x ** 2 }
  end

  def square!
    return self unless !empty?
    self.map! { |x| x ** 2 }
  end
end
