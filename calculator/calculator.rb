
class Calculator
  def add(*args)
    args.inject(0){|sum, x| sum+x}
  end
  
  def sum(args)
    add(*args)
  end

  def subtract(x,y)
    x-y
  end
  
  def factorial(x)
    if x == 0
      0
    elsif x == 1
      1
    else
      x * (factorial(x-1))
    end
  end
end
