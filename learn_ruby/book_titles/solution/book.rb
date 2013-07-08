require "../03_simon_says/simon_says"

class Book
  attr_accessor :title
  def title=(str)
    @title = titleize(str) 
  end
end
