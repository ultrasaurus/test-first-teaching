# by john.arthur.grandy@gmail.com

def translate(s)
  vowels = ['a','e','i','o','u','y']
  a = s.split.map do |word|
  i = 0
  while !vowels.include? word[i,1]
    if ( word[i,2] == 'qu')
      i+=2
    else
      i+=1
    end
  end
  word[i..-1] + word[0,i] + 'ay'
  end
  a.join(' ')
end
