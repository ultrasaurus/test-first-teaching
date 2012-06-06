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
        base_file = @file.split('/').last
        h1 do
          text "Tests"
        end
        a.raw_file base_file, :href => base_file
        pre do
          text lines.join("\n")
        end
      end
    end
  end
end
