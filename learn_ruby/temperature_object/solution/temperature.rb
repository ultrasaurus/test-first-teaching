require "../01_temperature/temperature"

class Temperature
  attr_accessor :f
  attr_accessor :c 

  def initialize(x)
    x.each do |k,v|
      self.instance_variable_set("@#{k}", v) unless v.nil?
    end
    if @f.nil?
      if !@c.nil?
        @f = self.in_fahrenheit
      else
         puts "no args given"
      end
    else
      if !@c.nil?
        exit unless @f == (@c * 9.0/5.0) + 32.0
      else
        @c = self.in_celsius
      end
    end
  end

  def Temperature.from_celsius(x)
     Temperature.new({:c => x})
  end
 
  def Temperature.from_fahrenheit(x)
     Temperature.new({:f => x})
  end

  def in_fahrenheit
    (@c * 9.0/5.0)  + 32
  end
  def in_celsius
    (@f - 32.0) * 5.0/9.0
  end
end

class Celsius < Temperature

  def initialize(int)
    @c = int
    @f = self.in_fahrenheit
  end

end

class Fahrenheit < Temperature
  def initialize(int)
    @f = int
    @c = self.in_celsius
  end
end
