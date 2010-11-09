class Section < Erector::Widget
  needs :name, :text
  needs :page_id
  needs :anchor_name => nil

  def initialize(opts)
    super
    @anchor_name = @name.downcase.gsub(/[^a-z]/, '') unless @anchor_name
  end
  
  def href
    "/#{@page_id}#{@anchor_name.nil? ? "" : "##{@anchor_name}"}"
  end
  
  def as_toc
    a @name, :href => href
  end
  
  def content
    a :name => @anchor_name
    h2 @name
    if @text.is_a? Proc
      @text.call
    else
      markdown @text
    end
  end  
end
