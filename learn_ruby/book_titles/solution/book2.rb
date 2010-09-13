class Book
  def title=(str)
    words = str.split
    new_title = ""
    words.each_with_index do |word, index|
      if word.length > 3 or index == 0 or word == "i"
        new_title << word.capitalize
      else
        new_title << word
      end
      new_title << " "
    end
    @title = new_title.chop
  end

  def title
    @title
  end
end
