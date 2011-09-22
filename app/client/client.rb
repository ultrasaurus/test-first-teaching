require 'erector'

class Client < Erector::Widgets::Page

  external :style, <<-CSS
  .panel {
    border: 1px solid black;
    margin: 1em;
  }

  .panel h2 {
    padding: 0 .25em .1em;
    border-bottom: 1px solid black;

    -webkit-margin-before: 0;
    -webkit-margin-after: 0;
    -webkit-margin-start: 0;
    -webkit-margin-end: 0;
  }
  CSS

  def page_title
    "Test-First Client"
  end

  def panel title, panel_class = title.downcase
    div(:class => "panel #{panel_class}") {
      h2 title
      yield if block_given?
    }
  end

  def body_content
    div.top {

    }
    div.main {
      panel "Notes"
      panel "Tests"
      panel "Results"
      panel "Code"
    }
  end
end

if $0 == __FILE__
  require 'erector/erect/erect'
  exit 1 unless Erector::Erect.new(["--to-html", __FILE__]).run
end
