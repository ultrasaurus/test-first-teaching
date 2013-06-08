# author: Alex Chaffee

def translate phrase
  phrase.split.map do |word|

    # we are using "/x" to document this big fat regex
    word =~ /^     # beginning of string
    (
      [^aeiouyq]*  # any number of consonants in a row
      (qu)?        # or maybe a 'qu'
    )
    (.*)           # the rest of the string
    $/x            # end of string

    # $1, $2, etc. get filled with the parenthesized chunks
    # from the most recent regular expression match
    first_phoneme = $1
    rest_of_word = $3
    "#{rest_of_word}#{first_phoneme}ay"
  end.join(" ")
end
