require 'erector'
require 'erector_scss'
require 'rdiscount'

class Live < Erector::Widgets::Page

  external :js, "/jquery-1.7.2.min.js"

  external :style, scss(<<-CSS)

  body {
    padding: 0;
    margin: 0;
  }

  .main {
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    .panels {
      text-align: center;
    }
  }

  .controls {
    width: 100%;
    margin: 0;
    font-size: 12px;
    text-align: center;
    background-color: #929;
    padding: 2px;

    input[type=button] {
      background: #ccc;
      font-size: 20pt;
    }
  }

  .panel.wide {
    height: 20em;
    width: 81em;
  }

  .response {
    border: 2px solid #22d;
    @include border-radius(6px);

    h2 {
      padding: 0 .25em .1em;
      border-bottom: 1px solid black;

      -webkit-margin-before: 0;
      -webkit-margin-after: 0;
      -webkit-margin-start: 0;
      -webkit-margin-end: 0;
    }
  }

  .panel {
    display: inline-block;
    border: 2px solid #22d;
    @include border-radius(6px);
    margin: .25em;
    width: 40em;
    text-align: center;
    position: relative; /* to get the title contained */

    .title {
      position: absolute;
      right: 2px;
      @include border-radius(6px);
      padding: 2px .25em;
      border: 1px solid black;
      margin: .25em;
      background-color: #eee;
    }

    .panel_contents {
      font-size: 14px;
      width: 95%;
      height: 20em;
      margin: 4px 8px;
      overflow: auto;
      display: inline-block;
      vertical-align: top;
      text-align: left;

      .error {
        border: 4px solid #F22;
        font-size: 200%;
      }
      div.test {
        margin: 1px 0 4px;
        div.description {
          padding: 2px 2px 2px 1em;
        }
        span.description {
          font-weight: bold;
        }
      }
      div.test.failed {
        background-color: #F99;
        .exception {
          background-color: #FDD;
          padding: 1em 0 1em 6em;
        }
      }
      div.test.passed {
        background-color: #9F9;
      }
    }

    .code_box {
      border: 1px solid #dedede;
      padding: 4px;
      font-family: "Courier New", Courier, Monaco, monospace;
      font-size: 12px;
    }
  }
  CSS

  def page_title
    "Test-First Live!"
  end

  def panel title, options = {}
    panel_class = options[:class] || title.downcase
    panel_size = options[:wide] ? "wide" : nil
    div(:class => "panel #{panel_class} #{panel_size}") {
      div.title title
      if options[:code]
        textarea.code_box.panel_contents :name => panel_class, :id => panel_class do
          text options[:code]
        end
      elsif options[:empty]
        yield if block_given?
      else
        div :class => "panel_contents", :id => panel_class do
          yield if block_given?
        end
      end
    }
  end

  def body_content
    div.main {
      div.controls {
        input :type => "button", :value => ">> Run >>", :id => 'run'
      }
      div.panels {
        if @notes
          panel "Notes", :wide => true do
            markdown = File.read(@notes)
            html = Markdown.new(markdown).to_html
            rawtext html
          end
        end
        div.user {
          panel "Tests", :code => File.read(@test).
            gsub(/require "hello"\n/, '')  # todo: generalize this for other labs
          panel "Source", :code => ""
          panel "Results", :wide => true
        }
        div.response do
          h2 "Response"
          panel "standard_output", :code => ''
          panel "standard_error", :code => ''
          panel "full_response", :code => ''
        end
      }
    }

    javascript <<-JAVASCRIPT
jQuery(document).ready(function($){

  function escapeHtml(html) {
    return String(html)
    .replace(/&/g, '&amp;')
    .replace(/\"/g, '&quot;')
    .replace(/'/g, '&#39;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');
  }

  function pretty(hash) {
    return JSON.stringify(hash, null, 2) || "";
  }

  function pre(text) {
    return "<pre>" + escapeHtml(text) + "</pre>"
  }

  function backtrace(array) {
    var text = "";
    $.each(array, function(index, line) {
      if (!line.match(/(\\/lib\\/rspec|\\/lib\\/spork|\\/drb\\/drb.rb)/)) {
        text += line + "\\n"
      }
    });
    return text;
  }

  function writeResults(data) {
    // write hidden low-level results
    $('#full_response').text(pretty(data));
    $('#standard_output').text(data.stdout || "");
    $('#standard_error').text(data.stderr || "");

    // todo: formatting, esp. errors and test results
    var html = "";
    if (data.error) {
      html =
        "<div class='error'>" +
        "<h2>" + data.error.class + "</h2>" +
        "<p>" + escapeHtml(data.error.message) + "</p>" +
        "<p>line " + data.error.line + "</p>" +
        "</div>";
    } else if (data.rspec_results) {
      html ="<div class='" + (data.rspec_results.summary.failure_count > 0 ? "failed" : "success") +  "'>";
      html += "<p class='summary'>" + data.rspec_results.summary_line + "</p>"
      $.each(data.rspec_results.examples, function(index, example) {
        html += "<div class='test " + example.status + "'>" +
          // todo: line number
          "<div class='description'>" +
            "<span class='description'>" + example.full_description + "</span>" +
            " - " +
            "<span class='status'>" + example.status + "</span>" +
          "</div>"

        if (example.status == "failed") {
          html += "<div class='exception'>"
          html += escapeHtml(example.exception.class) + ":<br>"
          html += pre(example.exception.message);
          // todo: backtrace, once we have useful files and lines
          // html += pre(backtrace(example.exception.backtrace))
          html += "</div>"
        }
        html += "</div>"
      });
    } else {
      html = "<pre>" + pretty(data) + "\\n</pre>";
    }

    $('#results').html(html);
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
      error: function(jqXHR) {
        console.log("ajax error");
        console.log(jqXHR);
        data = {};
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
