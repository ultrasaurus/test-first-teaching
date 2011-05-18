require "page"

# abstract base class for LearnRuby and LearnJavaScript
class Learn < Page

  def lang
    "Something"
  end

  def name
    "Learn #{lang}"
  end

  def page_id
    "learn_#{lang.downcase}"
  end

  def main_title
    h1 name
  end

  def sections
    [
      new_section(:name => "Install", :text => <<-MARKDOWN),
There are two ways to get the Learning #{lang} materials. Choose one:

1. Download and unpack this tarball
> [learn_#{lang.downcase}.tgz](download/learn_#{lang.downcase}.tgz)
2. Use git to clone the repository
> <span style='white-space:nowrap'>`git clone git://github.com/alexch/learn_#{lang.downcase}.git`</span>

Once you get the materials, open `learn_#{lang.downcase}/index.html` in your favorite web browser. Further instructions await therein.
  MARKDOWN

      new_section(:name => "Join the Conversation", :text => lambda do
        p do
          text 'Any questions or problems? Ask on our '
          a :href => 'http://groups.google.com/group/test-first-teaching' do
            text 'test-first teaching mailing list'
          end
          text '.'
        end
      end),


    ]
  end
end

