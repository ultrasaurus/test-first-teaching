require "page"

class Home < Page
  def toc
  end

  def page_id
    ""
  end
  
  def main
    div :class => "main" do    
      p 'This website provides a path to learning Ruby through self-guided exercises that use a software test framework.  This methodology is called "Test First Teaching" and has been applied successfully in a classroom environment.'
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
