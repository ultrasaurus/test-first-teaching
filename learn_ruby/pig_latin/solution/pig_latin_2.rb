
    # Basic pig latin translation rules are:
    #  - if word begins with consonant, move consonant to end + append 'ay'
    #  - if word begins with a vowel append 'ay'to end
    #  - if word begins with 'qu' move these to the end and append 'ay' 

    # private method to convert a single word to pig latin
    # this solution uses regular expressions to match search patterns
    # also uses 'case' statements rather than nested 'if/then/else' constructs
 
    def translateword(word)
          res = case word
          when /^[aeiouy]/
             # test for leading vowels (e.g. 'eat')
             # append 'ay' to end of string
             word+"ay"

          when /^(qu+)(.*)/   
          	# test for leading 'qu' string (special case)
          	# note the use of the parenthesis here to save 
          	# the matching substrings to the variables '$1' and '$2' respectively
            $2+$1+"ay"

          when /([^aeiouy]+)(.*)/
            # test for leading consonants (non vowels - e.g. 'stupid') 
            # also note the use of parenthesis as in the previous case
            # '$1' variable here will capture the leading consonants in a word
            # '$2' variable will capture the remainder of the word
            $2+$1+"ay"
          else
            # if no matches return word (should never happen)
            word
        end
    end

    def translate(phrase)
        #puts "transate word:  #{phrase}"
        puts
        piglist = []
        # split phrase into array of words
        wlist = phrase.split
        # iterate over thearray elements
        wlist.each do |w|
            piglist << translateword(w)
         end
        # print a trace here if you want to see what is happening
        # note the use of inspect here to show the individual array elements
        puts "word/phrase:  #{phrase}; pig latin translation:  #{piglist.inspect} \n"
        # Assemble the converted words into a new phrase
        res = piglist.join(" ")  
    end
