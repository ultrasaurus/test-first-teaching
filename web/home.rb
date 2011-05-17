require "page"

class Home < Page
  def toc
  end

  def page_id
    ""
  end
  
  def main
    div :class => "main home" do
      p 'This website provides a path to learning Ruby through self-guided exercises that use a software test framework.  This methodology is called "Test First Teaching" and has been applied successfully in a classroom environment.'
      
      div :id=>"introVideo" do
        z=0.9
        w=(640*z).to_i
        h=(385*z).to_i
        rawtext <<-HTML
      		<object width="#{w}" height="#{h}"><param name="movie" value="http://www.youtube.com/v/KgfdlZuVz7I?fs=1&amp;hl=en_US"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/KgfdlZuVz7I?fs=1&amp;hl=en_US" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="#{w}" height="#{h}"></embed></object> 
      		HTML
      end      
      
      p do
        text 'To learn more about test-first teaching, read the '
        a "About Test-First Teaching", :href => '/about'
        text ' page.'
      end
      p do
        text 'To learn Ruby via tests, read the '
        a "Learn Ruby", :href => '/learn_ruby'
        text ' page.'
      end
    end
  end

end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
