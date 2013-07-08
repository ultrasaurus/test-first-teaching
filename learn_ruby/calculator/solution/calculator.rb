def add(x,y)
  x + y
end

def subtract(x,y)
  x - y
end

def sum(a)
  sum = 0 
  a.each {|n| sum += n }
  sum
end

def multiply(x,y)
  x * y
end

def power(x,m)
  x ** m
end

def factorial(x)
  result = 1 
  x.times do |n|
    result *= (n + 1)    
  end
  result
end
