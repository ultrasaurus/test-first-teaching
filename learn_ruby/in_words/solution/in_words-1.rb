module Inwords
    def in_words
      number = self
      if number == 0
        return 'zero'
      end
      num_output = ''

      def thingz number, num_output, size, size_text
        if number > size - 1
          thisnum = number / size
          if thisnum > 0
            num_output = num_output + "#{thisnum.in_words} #{size_text}" 
            number = number - (thisnum * size)
            if number > 0
              num_output += ' '
            end
          end
        end     
        return number, num_output 
      end

      number, num_output = thingz(number, num_output, 1000000000000, "trillion")
      number, num_output = thingz(number, num_output, 1000000000, "billion")
      number, num_output = thingz(number, num_output, 1000000, "million")
      number, num_output = thingz(number, num_output, 1000, "thousand")
      number, num_output = thingz(number, num_output, 100, "hundred")

      tens_digit = number / 10
      ones_digit = number - tens_digit * 10
      ones = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
      tens = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
      teens = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'ten']
      if tens_digit == 1
        num_output += teens[ones_digit - 1]
        return num_output
      end
      if tens_digit > 1  
        num_output += tens[tens_digit - 1 ]
        if ones_digit > 0
          num_output += ' '
        end
      end
      if ones_digit > 0
        num_output += ones[ones_digit - 1]
      end
      return num_output
    end # end in_words method
end # end module


class Fixnum  
    include Inwords
end 

class Bignum
    include Inwords
end