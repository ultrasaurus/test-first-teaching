
def echo(s)
  s
end

def shout(s)
  s.upcase
end

def repeat(s, times = 2)
  ([s] * times).join(" ")
end

def start_of_word(s, n)
  s[0...n]
end

def first_word(s)
  s.split(" ").first
end

def capitalize(s)
  s[0].upcase + s[1..-1]
end

def titleize(s)
  s.split.map{|word| capitalize(word)}.join(" ")
end

