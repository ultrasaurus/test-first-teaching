class Temperature
  def ftoc(f)
    (f-32) * (5.0/9.0)
  end
  
  def ctof(c)
    c * (9.0/5.0) + 32
  end
end
