
class Curriculum < Page
  needs :name
  
  def page_id
    @name
  end
  
  def name
    @name.titleize
  end
  
  def sections
    @sections ||= begin
      here = File.expand_path(File.dirname(__FILE__))
      text = File.read("#{here}/../#{@name}/index.md")
      # section_texts = text.split(/^# /)
      # p section_texts
      [new_section(:name => @name, :text => text)]
    end
  end
  
end
