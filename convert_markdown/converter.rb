
class Converter
  def markdown=(doc)
    @doc = doc
    @doc.gsub!(/^###/, "h3.")
    @doc.gsub!(/^##/, "h2.")
    @doc.gsub!(/^#/, "h1.")
    @doc.gsub!(/!\[.*]\((.*?)\)/, '!\1!')

  end

  def textile
    @doc
  end
end

