class Erector::Widget
  def markdown(s)
    rawtext Markdown.new(s).to_html
  end

  def stylesheet(href)
    link :rel=>"stylesheet", :type=>"text/css", :href=> href
  end
end

class String
  def titleize
    self.gsub('_', ' ').split(' ').map{|word|word.capitalize}.join(' ')
  end
end
