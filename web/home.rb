require "page"

class Home < Page
  def toc
  end

  def main
    div :class => "main" do    
      p 'This website provides a path to learning Ruby through self-guided exercises that use a software test framework.  This methodology is called "Test First Teaching" and has been applied successfully in a classroom environment.'
    end
  end

end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
