class Dictionary
  def words
    @words ||= []
  end

  def add word
    words << word
  end

  def include? word
    words.include? word
  end

  def find partial_word
    words.select {|word| word =~ /^#{partial_word}/}
  end
end
