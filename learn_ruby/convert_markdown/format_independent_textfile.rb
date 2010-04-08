require 'converter'

class FormatIndependentTextfile < File
  def textile
    self.rewind
    c = Converter.new
    c.markdown = self.read
    c.textile
  end
end
