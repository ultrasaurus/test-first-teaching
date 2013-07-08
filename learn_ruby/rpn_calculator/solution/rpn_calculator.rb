class RPNCalculator
  attr_accessor :calculator
  attr_accessor :value

  def initialize
    @calculator = []
  end

  def empty?
    @calculator.length < 2
  end

  def push(x)
    @calculator.push(x)
  end

  def plus
    raise "calculator is empty" unless !empty?
    @value = @calculator.pop
    @calculator[-1] += @value
    @value = @calculator[-1]
  end

  def minus
    raise "calculator is empty" unless !empty?
    @value = @calculator.pop
    @calculator[-1] -= @value
    @value = @calculator[-1]
  end

  def divide
    raise "calculator is empty" unless !empty?
    @value = @calculator.pop.to_f
    @calculator[-1] = @calculator[-1].to_f / @value
    @value = @calculator[-1]
  end

  def times
    raise "calculator is empty" unless !empty?
    @value = @calculator.pop.to_f
    @calculator[-1] = @calculator[-1].to_f * @value
    @value = @calculator[-1]
  end

  def tokens(x)
    token_array = []
    x.split.each do |z| 
      if z[/\d+/] != nil
        token_array.push(z.to_i)
      elsif z[/(\+|\-|\*|\/)/] != nil
        token_array.push(z.to_sym)  
      end
    end
    token_array
  end

  def evaluate(x)
    tokens(x).each do |s| 
      if s.is_a? Integer
        push(s)
      elsif s.is_a? Symbol
        plus unless s != :+
        minus unless s != :-
        times unless s != :*
        divide unless s != :/
      end
    end
    @value
  end

end
