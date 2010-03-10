
class Fixnum
  def in_words
    number = self
    if number == 0
      return 'zero'
    end
    numOutput = ''

    if number > 999999
      millions = number / 1000000
      if millions > 0
        numOutput = numOutput + "#{millions.in_words} million" 
        number = number - (millions * 1000000)
        if number > 0
          numOutput += ' '
        end
      end
    end

    if number > 999
      thousands = number / 1000
      if thousands > 0
        numOutput = numOutput + "#{thousands.in_words} thousand" 
        number = number - (thousands * 1000)
        if number > 0
          numOutput += ' '
        end
      end
    end

    if number > 99
      hundreds = number / 100
      if hundreds > 0
        # moreOutput = hundreds.in_words
        numOutput = numOutput + "#{hundreds.in_words} hundred" 
        number = number - (hundreds * 100)
        if number > 0
          numOutput += ' '
        end
      end
    end
    
    tensDigit = number / 10
    onesDigit = number - tensDigit * 10
    ones = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
    tens = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
    teens = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'ten']
    if tensDigit == 1
      numOutput += teens[onesDigit - 1]
      return numOutput
    end
    if tensDigit > 1  
      numOutput += tens[tensDigit - 1 ]
      if onesDigit > 0
        numOutput += ' '
      end
    end
    if onesDigit > 0
      numOutput += ones[onesDigit - 1]
    end
    return numOutput
  end # end in_words method
end # end class

class Bignum
  def in_words
    number = self
    numOutput = ''
    if number > 999999999
      billions = number / 1000000000
      if billions > 0
        numOutput = numOutput + "#{billions.in_words} billion" 
        number = number - (billions * 1000000000)
        if number > 0
          numOutput += ' ' + number.in_words.to_s
          return numOutput
        else
          return numOutput
        end
      end
    end
  end
end