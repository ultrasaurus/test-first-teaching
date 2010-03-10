module PigLatinTranslator

    def translate(s)
      puts "english phrase is: "+s
      words = s.split
      pigified = [] 
      
      for word in words
        if  word[/^[aeiou]/]
          word = word+"ay"
        else
          if word[/^[qu]/] 
           word.slice!(/^qu/)
           ending = "quay"           
          else
           ending = word.slice!(0...(word.index(/[aeiou]/,1)))+"ay"
          end
          word = word << ending
        end 
        pigified << word
      end
      puts "pig latin phrase is: "+pigified.join(" ")
      return pigified.join(" ")
    end
end
