require 'erector'
require 'erector_scss'

class Live < Erector::Widgets::Page

  external :js, "/jquery-1.7.2.min.js"
  external :style, scss(<<-CSS)
  .panel {
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    border: 1px solid black;
    margin: 1em;

    h2 {
      padding: 0 .25em .1em;
      border-bottom: 1px solid black;

      -webkit-margin-before: 0;
      -webkit-margin-after: 0;
      -webkit-margin-start: 0;
      -webkit-margin-end: 0;
    }

    .code {
      textarea {
        font-family: "Courier New", Courier, Monaco, monospace;
        font-size: 14px;
        width: 90%;
        margin: 4px 8px;
        height: 20em;
        width: 40em;
      }
    }
  }
  CSS

  def page_title
    "Test-First Live!"
  end

  def panel title, options = {}
    panel_class = options[:class] || title.downcase
    div(:class => "panel #{panel_class}") {
      h2 title
      if options[:code]
        div.code {
          textarea :name => panel_class, :id => "#{panel_class}_code" do
            text options[:code]
          end
        }
      end
      yield if block_given?
    }
  end

  def body_content
    div.top {
      h1 "Run Live Code!"
      form :action => "/run", :method => "post" do
        textarea :name => "code"
        input :type => "submit", :name => "submit", :value => "Run"
      end
    }
    div.main {
      panel "Notes"
      table {
        tr {
          td { panel "Tests", :code => File.read(@test) }
          td { panel "Source", :code => "" }
        }
        tr :align => "center" do
          td {
            input :type => "button", :value => "Run", :id => 'run', :style => "width: 50px; height: 50px; font-size: 96pt"
            jquery <<-JAVASCRIPT
            $('#run').click(function(){
              var jqXHR = $.ajax({
                type: 'POST',
                dataType: 'json',
                url: '/run',
                data: {
                  code: $('#source_code').val(),
                  rspec: $('#tests_code').val()
                },
                success: function(data, jqXHR) {
                  $('#results_code').val(data.stdout);
                },
                error: function(data, jqXHR) { alert(data); }
              });
            });
            JAVASCRIPT
          }
        end
      }
      panel "Results", :code => ""
    }
  end
end

# if $0 == __FILE__
#   require 'erector/erect/erect'
#   exit 1 unless Erector::Erect.new(["--to-html", __FILE__]).run
# end
