class Dictionary
  def entries
    @entries ||= {}
  end

  def add new_entry
    case new_entry
      when Hash
        entries.merge!(new_entry)
      when String
        entries[new_entry] = nil
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include? word
    entries.keys.include? word
  end

  def find partial_word
    result = {}
    entries.each_pair do |key, definition|
      if key =~ /^#{partial_word}/
        result[key] = definition
      end
    end
    result
  end

  def printable
    entries.map do |key_val|
      %Q{[#{key_val.first}] "#{key_val.last}"}
    end.sort.join("\n")
  end
end
