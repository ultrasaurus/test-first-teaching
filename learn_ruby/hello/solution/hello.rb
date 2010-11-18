class Hello
  def initialize(who = nil)
    @who = who
  end
  
  def message
    "hello#{", #{@who}" if @who}"
  end
end
