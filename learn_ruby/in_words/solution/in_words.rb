class Fixnum
  def in_words
    #Cases Less Than a Hundred
    if self < 100
      tens = self 
      if self < 20
        return "zero" unless tens != 0
        return "one" unless tens != 1
        return "two" unless tens != 2
        return "three" unless tens != 3
        return "four" unless tens != 4
        return "five" unless tens != 5
        return "six" unless tens != 6
        return "seven" unless tens != 7
        return "eight" unless tens != 8
        return "nine" unless tens != 9
        return "ten" unless tens != 10
        return "eleven" unless tens != 11
        return "twelve" unless tens != 12
        return "thirteen" unless tens != 13
        return "fourteen" unless tens != 14
        return "fifteen" unless tens != 15
        return "sixteen" unless tens != 16
        return "seventeen" unless tens != 17
        return "eighteen" unless tens != 18
        return "nineteen" unless tens != 19
      else
        tens -= self % 10 
        return "twenty "+(self % 10).in_words unless (tens != 20 or (self % 10) == 0)
        return "twenty" unless tens != 20 
        return "thirty "+(self % 10).in_words unless (tens != 30 or (self % 10) == 0)
        return "thirty" unless tens != 30 
        return "forty "+(self % 10).in_words unless (tens != 40 or (self % 10) == 0)
        return "forty" unless tens != 40 
        return "fifty "+(self % 10).in_words unless (tens != 50 or (self % 10) == 0)
        return "fifty" unless tens != 50 
        return "sixty "+(self % 10).in_words unless (tens != 60 or (self % 10) == 0)
        return "sixty" unless tens != 60 
        return "seventy "+(self % 10).in_words unless (tens != 70 or (self % 10) == 0)
        return "seventy" unless tens != 70 
        return "eighty "+(self % 10).in_words unless (tens != 80 or (self % 10) == 0)
        return "eighty" unless tens != 80 
        return "ninety "+(self % 10).in_words unless (tens != 90 or (self % 10) == 0)
        return "ninety" unless tens != 90 
      end
    #Cases Greater Than a Hundred
    elsif self < 1000
      hundreds = (self - (self % 100)) / 100
      return hundreds.in_words + " hundred" unless (self % 100) != 0
      return hundreds.in_words + " hundred " + (self % 100).in_words
    elsif self < 1000000
      thousands = (self - (self % 1000)) / 1000
      return thousands.in_words + " thousand" unless (self % 1000) != 0
      return thousands.in_words + " thousand " + (self % 1000).in_words
    elsif self < 1000000000
      millions = (self - (self % 1000000)) / 1000000
      return millions.in_words + " million" unless (self % 1000000) != 0
      return millions.in_words + " million " + (self % 1000000).in_words 
    elsif self < 1000000000000
      billions = (self - (self % 1000000000)) / 1000000000
      return billions.in_words + " billion" unless (self % 1000000000) != 0
      return billions.in_words + " billion " + (self % 1000000000).in_words 
    elsif self < 1000000000000000
      trillions = (self - (self % 1000000000000)) / 1000000000000
      return trillions.in_words + " trillion" unless (self % 1000000000000) != 0
      return trillions.in_words + " trillion " + (self % 1000000000000).in_words 
    end 
  end
end
