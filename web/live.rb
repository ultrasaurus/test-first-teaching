require 'erector'
require 'erector_scss'
require 'rdiscount'

class Live < Erector::Widgets::Page

  external :js, "/jquery-1.7.2.min.js"

  external :style, scss(<<-CSS)

  $control_bar: #08253B;
  $button_bg: #E6EFF5;
  $button_hover: #00AEEF;
  $panel_border: #559;
  $panel_title_bg: #EEE;
  $error_border: #F33;
  $test_failed_bg: #F99;
  $test_exception_bg: #FDD;
  $test_passed_bg: #9F9;
  $code_border: #DEDEDE;

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
    background-color: $control_bar;
    padding: 2px;

    input[type=button] {
      background: $button_bg;
      font-size: 16pt;

      &:hover {
        background: $button_hover;
      }
    }
  }

  .panel.wide {
    height: 20em;
    width: 81em;
  }

  #notes {
    text-align: left;
    padding: 1em;
  }

  .toggleable {

    /* initially invisible, toggleable panel */
    display: none;
    position: absolute;
    z-index: 10;
    background-color: white;
    overflow-y: auto;

    margin: 0 1em;

    border: 2px solid $panel_border;
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
    border: 2px solid $panel_border;
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
      background-color: $panel_title_bg;
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
        border: 4px solid $error_border;
        padding: .5em;
        font-size: 200%;
        h2 {
          padding: 0 .25em .1em;
          border-bottom: 1px solid black;

          -webkit-margin-before: 0;
          -webkit-margin-after: 0;
          -webkit-margin-start: 0;
          -webkit-margin-end: 0;
        }
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
        background-color: $test_failed_bg;
        .exception {
          background-color: $test_exception_bg;
          padding: 1em 0 1em 6em;
        }
      }
      div.test.passed {
        background-color: $test_passed_bg;
      }
    }

    .code_box {
      border: 2px solid $code_border;
      padding: 4px;
      font-family: "Courier New", Courier, Monaco, monospace;
      font-size: 12px;
    }
  }
  CSS

  needs :course, :lab_name => "hello"

  def initialize *args
    super
    @notes = ("#{lab_dir}/index.md" if File.exist? "#{lab_dir}/index.md")
  end

  def lab_dir lab_name = @lab_name
    @course.lab_dir(lab_name)
  end

  def test
    "#{lab_dir}/#{lab_name}_spec.rb"
  end

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

  def here
    File.expand_path(File.dirname __FILE__)
  end

  def labs_panel
    div.toggleable.labs! do
      h2 "Labs"
      ul do
        current_lab = @lab_name
        @course.lab_names.each do |lab_name|
          li do
            # todo: pretty lab name; Lab object
            if lab_name == @lab_name
              span.current lab_name
            else
              a lab_name, :href => "/live/#{@course.course_name}/#{lab_name}"
            end
          end
        end
      end
    end
  end

  def body_content
    div.main {
      div.controls {
        input :type => "button", :value => ">> Run >>", :id => 'run'
        input :type => "button", :value => "Notes", :id => 'toggle_notes' if @notes
        input :type => "button", :value => "Labs", :id => 'toggle_labs'
        input :type => "button", :value => "Full Response", :id => 'toggle_response'
      }
      div.toggleable.response! do
        h2 "Response"
        panel "standard_output", :code => ''
        panel "standard_error", :code => ''
        panel "full_response", :code => ''
      end
      if @notes
        div.toggleable.notes! do
          h2 "Notes"
          markdown = File.read(@notes)
          html = Markdown.new(markdown).to_html
          rawtext html
        end
      end

      labs_panel

      div.panels {
        div.user {
          panel "Tests", :code => File.read(@course.lab_dir(@lab_name) + "/#{@lab_name}_spec.rb").
            gsub(/require [\"\'].*[\"\'].*\n/, '')  # todo: allow some requires
          panel "Source", :code => ""
          panel "Results", :wide => true
        }
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

  $('#toggle_response').click(function() {
    $('#response').toggle();
  });

  $('#toggle_notes').click(function() {
    $('#notes').toggle();
  });

  $('#toggle_labs').click(function() {
    $('#labs').toggle();
  });
});
    JAVASCRIPT
  end

end



# if $0 == __FILE__
#   require 'erector/erect/erect'
#   exit 1 unless Erector::Erect.new(["--to-html", __FILE__]).run
# end
