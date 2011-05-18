require "page"

class LearnRuby < Page

  def name
    "Learn Ruby"
  end

  def main_title
    h1 name
  end

  def sections
    [
      new_section(:name => "Install", :text => <<-MARKDOWN),
There are two ways to get the Learning JavaScript materials. Choose one:

1. Download and unpack this tarball
> [learn_ruby.tgz](download/learn_ruby.tgz)
2. Use git to clone the repository
> `git clone git://github.com/alexch/learn_ruby.git`

Once you get the materials, open `learn_ruby/index.html` in your favorite web browser. Further instructions await therein.
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

