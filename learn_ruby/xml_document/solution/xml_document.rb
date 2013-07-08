class XmlDocument
  attr_accessor :indent
  attr_accessor :depth

  def initialize(x = false)
    @indent = x
    @depth = 0
  end

  def hello(x = nil, s = "hello", &b) 
    @depth += 1
    spaces = ""
    (@depth-1).times{spaces += "  "}
    if b
      return "<#{s}>#{b.call}</#{s}>" unless @indent
      return "<#{s}>\n#{spaces}  #{b.call}#{spaces}</#{s}>\n" 
    end
    return "<#{s}/>" unless (x != nil)
    x.each do |k,v|
      return "<#{s} #{k}='#{v}'/>" unless @indent
      return "<#{s} #{k}='#{v}'/>\n"
    end
  end

  def goodbye(x = nil, &b)
    if b
      hello(x, "goodbye") do
        b.call
      end
    else
      hello(x, "goodbye")
    end
  end

  def come_back(x = nil, &b)
    if b
      hello(x, "come_back") do
        b.call
      end
    else
      hello(x, "come_back")
    end
  end

  def ok_fine(x = nil, &b)
    if b
      hello(x, "ok_fine") do
        b.call
      end
    else
      hello(x, "ok_fine")
    end
  end

  def send(tag_name)
    "<#{tag_name}/>"
  end

end
