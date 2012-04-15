require 'erector'
require 'erector_scss'

class Live < Erector::Widgets::Page

  external :js, "/jquery-1.7.2.min.js"
  external :style, scss(<<-CSS)
  .panel {
    display: inline-block;
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

    .code_box {
      border: 1px solid #dedede;
      padding: 4px;
      font-family: "Courier New", Courier, Monaco, monospace;
      font-size: 14px;
      width: 90%;
      margin: 4px 8px;
      height: 20em;
      width: 40em;
      overflow: auto;
      display: inline-block;
      vertical-align: top;
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
        textarea.code_box :name => panel_class, :id => "#{panel_class}" do
          text options[:code]
        end
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
                  code: $('#source').val(),
                  rspec: $('#tests').val()
                },
                success: function(data, jqXHR) {
                  console.log(data);
                  $('#output').text(data.stdout);
                  $('#error').text(JSON.stringify(data.error) || "");
                  $('#full_response').text(JSON.stringify(data, null, 2));
                },
                error: function(data, jqXHR) {
                  $('#output').text('');
                  $('#error').text('ERROR');
                  $('#full_response').text(JSON.stringify(data, null, 2));
                }
              });
            });
            JAVASCRIPT
          }
        end
      }
      panel "Response" do
        panel "output", :code => ''
        panel "error", :code => ''
        panel "full_response", :code => ''
      end
    }
  end
end

# if $0 == __FILE__
#   require 'erector/erect/erect'
#   exit 1 unless Erector::Erect.new(["--to-html", __FILE__]).run
# end
