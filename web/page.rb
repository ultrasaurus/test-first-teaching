here = File.expand_path(File.dirname(__FILE__))

require "erector"
require "rdiscount"
require "sass"

require "#{here}/ext"
require "#{here}/section"
require "#{here}/nav"

class Page < Erector::Widgets::Page
  needs :sections => []   # todo: test that this is mutate-safe

  def topic(s)
    strong s
    text ' '
  end

  def page_title
    "TestFirst.org - The Home of Test-First Teaching"
  end

  def head_content
    super

    # todo: try http://www.fontsquirrel.com/fonts/nevis
    # font = "SansationBold"
    # stylesheet "Sansation/stylesheet.css"
    stylesheet "Bentham/stylesheet.css"
    palette = %w{#779fe8 #c198ff #E2EBFD #77e882 #eeff82}

    header_text = '#2D384C'
    header_border = '#B4BCCA'
    nav_width = 16 # em

    here = File.expand_path(File.dirname(__FILE__))
    style raw(Sass::Engine.for_file("#{here}/tft-web.scss", {}).render)
  end

  def self.google_analytics_code account_id
    <<-JAVASCRIPT
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', '#{account_id}']);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
    JAVASCRIPT
  end

  external :script, google_analytics_code('UA-23415770-1')

  def body_content
    div :class => "wrapper" do
      headline
      nav
      main
      footer
    end
  end

  def headline
    div :class => "headline" do
      h1 do
        a 'TestFirst.org', :href => "/"
      end
      h2 "the home of test-first teaching"
    end
  end

  def nav
    widget Nav, :current_page => self.class
  end

  def name
    self.class.name # todo: titleize
  end

  def page_id
    self.class.name.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
  end

  def new_section(opts)
    Section.new(opts.merge({:page_id => page_id}))
  end

  def sections
    @sections
  end

  def main_title
  end

  def main
    div :class => "main" do
      main_title
      div :class => "sections" do
        sections.each do |section|
          widget section
        end
      end
    end
  end

  def footer
    div :class => "footer" do
      p do
        text "TestFirst.org is a production of "
        a "Sarah Allen", :href => "http://ultrasaurus.com"
        text ", "
        a "Alex Chaffee", :href => "http://alexch.github.com"
        text ", and many other contributors."
        br
        text "Front-end development by "
        a "Chandra Nalaani", :href => "http://chandranalaani.com/"
        text ". "
        text "This site uses "
        # a "Sansation", :href => "http://www.fontsquirrel.com/fonts/Sansation"
        # text " by "
        # text "Bernd Montag"
        a "Bentham", :href => "http://www.fontsquirrel.com/fonts/Bentham"
        text " by "
        a "Ben Weiner", :href => "http://www.readingtype.org/"
        text ". "
        text "Powered by "
        a "Erector", :href => "http://erector.rubyforge.org/"
        text "."
      end

    end
  end
end
