def add(x, y)
  x + y
end

def subtract(x, y)
  x - y
end

def sum(numbers)
  numbers.inject(0){|total, number| total+number}
end

def factorial x
  if x <= 1
    1
  else
    x * factorial(x-1)
  end
end
