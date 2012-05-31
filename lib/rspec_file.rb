require 'erector'
require 'rdiscount'

class RspecFile < Erector::Widget
  def initialize *args
    super
    @contents = File.read(@file)
  end

  def contents
    @contents
  end

  def content
    div.rspec_file do
      lines = @contents.split("\n")
      intro = ""
      while lines.first =~ /^# ?/
        line = lines.shift
        intro += (line.gsub(/^# ?/, '') + "\n")
      end
      div.intro do
        html = Markdown.new(intro).to_html
        text raw(html)
      end
      div.tests do
        pre do
          text lines.join("\n")
        end
      end
    end
  end
end
