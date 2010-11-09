class Nav < Erector::Widget
  def pages
    [Home.new, About.new, Curriculum.new(:name => "learn_ruby")]
  end

  def content
    div :class => "nav" do      
      ul do
        pages.each do |page|
          li do
            a page.name, :href => "/#{page.page_id}"
            ul do
              page.sections.each do |section|
                li do
                  widget section, {}, {:content_method_name => :as_toc}
                end
              end
            end
          end
        end
      end
    end
  end
end
