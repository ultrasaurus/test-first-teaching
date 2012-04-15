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
    div.main {
      panel "Notes"
      div.buttons(:style => "text-align: center;") {
        input :type => "button", :value => ">> Run >>", :id => 'run',
          :style => "background: #ccc; font-size: 32pt; margin:auto;"
      }
      div.user {
        panel "Tests", :code => File.read(@test)
        panel "Source", :code => ""
        panel "Results", :code => ""
      }
      panel "Response" do
        panel "standard_output", :code => ''
        panel "standard_error", :code => ''
        panel "full_response", :code => ''
      end
    }

    javascript <<-JAVASCRIPT
jQuery(document).ready(function($){

  function writeResults(data) {
    $('#full_response').text(JSON.stringify(data, null, 2) || "");
    $('#standard_output').text(data.stdout || "");
    $('#standard_error').text(data.stderr || "");

    // todo: formatting, esp. errors and test results
    $('#results').text(
      JSON.stringify(data, null, 2) || ""
    );
  }

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
        console.log("ajax success");
        writeResults(data);
      },
      error: function(data, jqXHR) {
        console.log("ajax error");

        data.error = {class: "System Error", message: "this is probably not your fault"}
        writeResults(data);

      }
    });
  });
});
    JAVASCRIPT
end

end



# if $0 == __FILE__
#   require 'erector/erect/erect'
#   exit 1 unless Erector::Erect.new(["--to-html", __FILE__]).run
# end
