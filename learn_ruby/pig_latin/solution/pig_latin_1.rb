module PigLatinTranslator
    def translate(s)
        words = s.split(' ')
        words = words.map do |word|
            if word[0].chr == 'q' 
                parts = ['qu', word.slice(2,word.length-2)]
            else 
                parts = word.split(/([aeiou].*)/)     
            end
            parts[1] + parts[0] + "ay"
        end
        words.join(' ')
    end
end
