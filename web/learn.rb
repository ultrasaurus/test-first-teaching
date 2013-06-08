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
There are two ways to get the Learning #{lang} materials.

If you have [git](http://git-scm.com/) installed, then you want to **use git to clone the repository**:

> <span style='white-space:nowrap'>`git clone git://github.com/alexch/learn_#{lang.downcase}.git`</span>

If you don't have [git](http://git-scm.com/), you may download and unpack this tarball. (But it's better to use git if you can!)

> [learn_#{lang.downcase}.tgz](download/learn_#{lang.downcase}.tgz)

Once you get the materials, **open `learn_#{lang.downcase}/index.html`** in your favorite web browser. Further instructions await therein.
  MARKDOWN

      new_section(:name => "Join the Conversation", :text => lambda do
        p do
          text 'Any questions or problems? Ask on our '
          a :href => 'http://groups.google.com/group/test-first-teaching' do
            text 'test-first teaching mailing list'
          end
          text '.'
        end
        p do
          text "To contribute lessons (or see solutions), check out the "
          a "test-first-teaching", href: "http://github.com/ultrasaurus/test-first-teaching"
          text " github repo."
        end

      end),


    ]
  end
end

