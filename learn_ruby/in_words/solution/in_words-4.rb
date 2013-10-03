module InWords
  def in_words
    number = self
    return 'zero' if number == 0

    ones = %w(one two three four five six seven eight nine)
    teens = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
    tens = %w(twenty thirty forty fifty sixty seventy eighty ninety)
    high = %w(thousand million billion trillion)

    phrase = []
    segments = number.to_s.reverse.scan(/.{1,3}/).map { |s| s.reverse.to_i }

    segments.each_with_index do |segment, i|
      if segment > 0
        words = []
        words << [ones[segment / 100 - 1], 'hundred'] if segment >= 100
        
        if segment % 100 > 0
          if segment % 100 >= 10 && segment % 100 < 20
            words << teens[segment % 100 - 10]
          else
            words << tens[segment % 100 / 10 - 2] if segment % 100 >= 20
            words << ones[segment % 10 - 1] if segment % 10 > 0
          end
        end

        unless words.empty?
          words << high[i-1] unless i == 0
          phrase << words.join(' ')
        end
      end
    end
    phrase.reverse.join(' ')
  end
end

class Fixnum
  include InWords
end

class Bignum
  include InWords
end
