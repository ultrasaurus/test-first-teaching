class Temperature

  def self.from_celsius degrees_celsius
    new(degrees_celsius * (9.0/5.0) + 32)
  end

  def initialize degrees_fahrenheit
    @degrees_fahrenheit = degrees_fahrenheit
  end

  def degrees_fahrenheit
    @degrees_fahrenheit
  end

  def degrees_celsius
    (@degrees_fahrenheit - 32) * (5.0/9.0)
  end

  def ftoc(f)
    (f-32) * (5.0/9.0)
  end

  def ctof(c)
    c * (9.0/5.0) + 32
  end
end
