module PigLatinTranslator
  def translate(word)
    words = word.split(" ")
    arrResult = []
    words.each do |word|
      m = word.match(/^(qu)*[^aeiou]*/)
      if(m.nil?)
        arrResult << add_ay(word)
      else
        arrResult <<  add_ay(m.post_match + m.to_s)
      end    
    end
    arrResult.join(" ")
  end
  
  def add_ay(word)
    word + "ay"
  end
end

