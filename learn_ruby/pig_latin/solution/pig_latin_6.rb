# author: Alex

def translate phrase
  phrase.split.map do |word|
    word =~ /^(qu|[^aeiouy]*)(.*)$/
    first_phoneme = $1  # $1 and $2 get filled with the parenthesized chunks
    rest_of_word = $2   # from the most recent regular expression match
    "#{rest_of_word}#{first_phoneme}ay"
  end.join(" ")
end
