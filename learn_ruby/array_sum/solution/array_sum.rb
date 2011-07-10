class Array
  def sum
    inject(0) {|sum, elem| sum + elem}
  end
end
