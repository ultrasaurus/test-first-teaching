module Inwords
    def in_words
      number = self
      if number == 0
        return 'zero'
      end
      numOutput = ''

      def thingz number, numOutput, size, size_text
        if number > size - 1
          thisnum = number / size
          if thisnum > 0
            numOutput = numOutput + "#{thisnum.in_words} #{size_text}" 
            number = number - (thisnum * size)
            if number > 0
              numOutput += ' '
            end
          end
        end     
        return number, numOutput 
      end

      number, numOutput = thingz(number, numOutput, 1000000000000, "trillion")
      number, numOutput = thingz(number, numOutput, 1000000000, "billion")
      number, numOutput = thingz(number, numOutput, 1000000, "million")
      number, numOutput = thingz(number, numOutput, 1000, "thousand")
      number, numOutput = thingz(number, numOutput, 100, "hundred")

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
end # end module


class Fixnum  
    include Inwords
end 

class Bignum
    include Inwords
end