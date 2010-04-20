class Calculator
  attr_reader :name
  attr_writer :num_calculations

  def initialize(name = "no name")
    @name = name
    @num_calculations = 0
  end

  def num_calculations
    @num_calculations
  end

  def add(a,b)
    @num_calculations += 1
    a + b 
  end
end
