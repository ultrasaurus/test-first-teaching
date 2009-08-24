module PigLatinTranslator
  def translate(s)
    s.split.map do |word|
      v = first_vowel(word)
      word.slice(v..-1) + word[0,v] + "ay"
    end.join(" ")
  end
  
  def first_vowel(word)
    if word =~ /^qu/
      2
    else
      word.gsub(/[aeiou].*$/, '').size
    end
  end
end
