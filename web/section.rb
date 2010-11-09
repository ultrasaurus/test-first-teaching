class Section < Erector::Widget
  needs :name, :text
  needs :aname => nil

  def initialize(opts)
    super
    @aname = @name.downcase.gsub(/[^a-z]/, '') unless @aname
  end
  
  def as_toc
    a @name, :href => "##{@aname}"
  end
  
  def content
    a :name => @aname
    h3 @name
    if @text.is_a? Proc
      @text.call
    else
      markdown @text
    end
  end  
end

