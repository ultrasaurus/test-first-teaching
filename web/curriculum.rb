class Curriculum < Page
  needs :name
  
  def page_id
    @name
  end
  
  def name
    @name.titleize
  end

  def main_title
    h1 name
  end
  
  def sections
    @sections ||= begin
      here = File.expand_path(File.dirname(__FILE__))
      text = File.read("#{here}/../#{@name}/index.md")
      chunks = text.split(/^\# /m)
      chunks.map do |chunk|
        next if chunk.empty?
        header, body = chunk.split("\n", 2)
        new_section(:name => header, :text => body)
      end.compact
    end
  end
  
end
