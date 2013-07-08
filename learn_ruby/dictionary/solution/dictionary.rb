class Dictionary
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add(x)
    if x.class == Hash
      @entries.merge!(x)
    else
      @entries.merge!({x => nil})
    end
  end
  
  def keywords
    @entries.keys.sort
  end

  def include?(x)
    @entries.has_key?(x)
  end

  def find(x)
    returnable = {} 
    y = Regexp.new(x)
    @entries.each do |k,v| 
      if (k =~ y) == 0
        returnable.merge!({ k => v })
      end
    end
      returnable
  end

  def printable
    printable = ""
    last_key = ""
    @entries.sort.each do |k,v| 
      last_key = k
    end
    @entries.sort.each do |k,v| 
      printable += ("["+k.to_s+'] "'+v+'"')
      printable += "\n" unless k == last_key 
    end
    printable
  end
end
