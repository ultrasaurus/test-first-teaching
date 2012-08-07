require "page"

class Home < Page
  def toc
  end

  def page_id
    ""
  end

  def main
    div :class => "main home" do
      p "Do you want to learn Ruby or JavaScript? Here's a self-guided path to learning to program using 'Test-First Teaching'. We've used it to teach hundreds of people. We want to teach you too!"

      p "Why test first? Traditionally, software homework is either fill-in-the-blank, tiny snippets, or huge, unstructured assignments. Test-first teaching guides you, one step at a time, to writing real programs from scratch."

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
        text ' page, or check out...'
        ul do
          li do
            a "Learning TDD Through Test-First Teaching", :href => ""
            text " (48 min. video) by Sarah Allen at East Bay Ruby Meetup, April 20, 2010"
            text " [embedded above]"
          end
          li do
             a "Test-First Teaching Talk", :href => "http://confreaks.net/videos/357-gogaruco2010-test-first-teaching"
             text " (30 min. video) - Sarah Allen and Alex Chaffee at GoGaRuCo, Sep. 17, 2010"
           end
         end
      end
      p do
        text 'To learn programming via tests, read the '
        a "Learn Ruby", :href => '/learn_ruby'
        text ' or '
        a "Learn JavaScript", :href => '/learn_javascript'
        text ' page.'
      end
      p {
        text 'To contribute to this project (or look for solutions), check out our '
        a 'test-first-teaching GitHub Repository', :href => "http://github.com/ultrasaurus/test-first-teaching"
        text "."
      }
      p do
        text "Want to try more flavors of test-guided learning? Check out..."
        ul {
          li {
            a "Ruby Koans", :href => "http://rubykoans.com/"
            text " to learn the Ruby language, syntax, structure, and some common functions and libraries - a useful complement to our "
            a "learn_ruby", :href => "/learn_ruby"
            text " labs"
          }
          li {
            a "Coding Bat", :href => "http://codingbat.com/"
            text " for online in-browser Java and Python exercises"
          }
          li {
            a "Ruby Kickstart", :href => "https://github.com/JoshCheek/ruby-kickstart"
            text " - screencast lectures and test-driven exercises"
          }
        }
      end
    end
  end

end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
