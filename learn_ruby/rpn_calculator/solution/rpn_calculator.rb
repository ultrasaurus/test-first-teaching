class RPNCalculator
  attr_accessor :stack

  def initialize
    @stack = [0]
  end

  def value
    return stack[stack.length - 1]
  end

  def add(x)
    push(x)
    plus
  end

  def subtract(x)
    push(x)
    minus
  end

  def push(value)
    stack.push(value.to_f)
  end

  def plus
    stack.push(pop + pop)
  end

  def minus
    second = pop
    first = pop
    stack.push(first - second)
  end

  def times
    stack.push(pop * pop)
  end

  def divide
    second = pop
    first = pop
    stack.push(first / second)
  end

  def pop
    value = stack.pop
    raise "calculator is empty" if value.nil?
    return value
  end

  def tokens s
    s.split.map do |t|
      case t
      when '+', '-', '*', '/'
        t.to_sym
      else
        t.to_f
      end
    end
  end

  def evaluate s
    tokens(s).each do |t|
      case t
      when :+
        plus
      when :-
        minus
      when :*
        times
      when :/
        divide
      else
        push t
      end
    end
    value
  end
end
