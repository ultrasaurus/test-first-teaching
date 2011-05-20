require "open-uri"

class CNN
  attr_accessor :uri
  attr_reader :source_data

  def uri=(new_uri)
    @uri=new_uri
    @source_data = ""
    open(new_uri) do |f|
      @source_data = f.read
    end
  end

  def latest_news
    match = @source_data.match(%r{<h4>Latest news<\/h4>.*?<li><a href="(.*?)">(.*?)<\/a>})
    {:url => match[1], :title => match[2].strip}
  end

end
