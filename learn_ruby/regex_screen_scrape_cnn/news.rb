require "open-uri"

class News
  attr_accessor :uri
  attr_reader :source_data

  def uri=(new_uri)
    @uri=new_uri
    @source_data = ""
    open(new_uri) do |f|
      @source_data = f.read
    end
  end
  
  def top_story
    match = @source_data.match(%r{<h4>Latest news<\/h4>.*?<li><a href="(.*?)">(.*?)<\/a>})
    {:url => match[1], :title => match[2].strip}
  end

  def latest
    [{:url=>"/2010/WORLD/americas/01/31/haiti.us.airlifts/index.html?hpt=T2", :title=>"Evacuations of Haitians to U.S. to resume"}] 
  end
end
