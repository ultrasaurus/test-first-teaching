module Converter
  def markdown=(doc)
    @textile = doc.gsub(/^##/, "h2.")
    @textile = @textile.gsub(/^#/, "h1.")
  end

  def textile
    @textile
  end

end
