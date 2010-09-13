module PigLatinTranslator
  def translate(s)
    words = s.split
      s = words.map do |s|
      l = s.length   
        if /^[aeiou]/ .match(s)
           s + "ay"
        elsif /^qu/ .match(s[0..1])
            s[2..(l+1)] + s[0..1] + "ay"
        elsif /[aeiou]/ .match(s[1..1])
            s[1..(l+1)] + s[0..0] + "ay"
        else
            s[2..(l+1)] + s[0..1] + "ay"
        end
      end 
      s = s.join(" ")
  end
end

