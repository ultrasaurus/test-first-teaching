module InWords
  def in_words
    number = self
    if number == 0
      return 'zero'
    end
    out = ''
    
    orders = [
      [100, "hundred"],
      [1000, "thousand"],
      [1_000_000, "million"],
      [1_000_000_000, "billion"],
      [1_000_000_000_000, "trillion"],
    ]

    orders.reverse.each do |limit, name|
      if number > (limit-1)
        count = number / limit
        if count > 0
          out << "#{count.in_words} #{name}"
          number -= (count * limit)
          if number > 0
            out << " "
          end
        end
      end
    end
    
    tens_digit = number / 10
    ones_digit = number - tens_digit * 10
    ones = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
    tens = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
    teens = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'ten']
    if tens_digit == 1
      out += teens[ones_digit - 1]
      return out
    end
    if tens_digit > 1  
      out << tens[tens_digit - 1 ]
      if ones_digit > 0
        out << ' '
      end
    end
    if ones_digit > 0
      out << ones[ones_digit - 1]
    end
    return out
  end
end

class Fixnum
  include InWords
end

class Bignum
  include InWords
end
