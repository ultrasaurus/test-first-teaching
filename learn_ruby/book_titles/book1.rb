class Book
  attr_reader :title

  def title=(new_title)
    words = new_title.split(" ").map do |w| 
      if w.length > 3 or w == "i"
        w.capitalize
      else
        w
      end
    end
    words[0] = words[0].capitalize
    @title = words.join(" ")
  end

end
