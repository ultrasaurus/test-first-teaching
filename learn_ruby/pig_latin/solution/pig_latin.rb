# author: Alex

def translate phrase
  phrase.split.map do |word|
    word =~ /^([^aeiouyq]*(qu)?)(.*)$/
    # $1, $2, etc. get filled with the parenthesized chunks
    # from the most recent regular expression match
    first_phoneme = $1
    rest_of_word = $3
    "#{rest_of_word}#{first_phoneme}ay"
  end.join(" ")
end
