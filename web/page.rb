here = File.expand_path(File.dirname(__FILE__))

require "erector"
require "rdiscount"
require "#{here}/section"

class Erector::Widget
  def markdown(s)
    rawtext Markdown.new(s).to_html
  end

  def stylesheet(href)
    link :rel=>"stylesheet", :type=>"text/css", :href=> href
  end
end

class Page < Erector::Widgets::Page
  def topic(s)
    strong s
    text ' '
  end

  def head_content
    # todo: try http://www.fontsquirrel.com/fonts/nevis
    font = "SansationBold"
    stylesheet "Sansation/stylesheet.css"
    palette = %w{#779fe8 #c198ff #E2EBFD #77e882 #eeff82}

    header_text = '#2D384C'
    header_border = '#B4BCCA'
    
    style <<-STYLE
body {
  font-size:100%; font-family: 'Lucida Grande', Verdana, Arial, Helvetica, sans-serif;
  padding: 0; margin: 0;
}
h1 {font: 3em '#{font}', 'Lucida Grande', sans-serif; letter-spacing: 0; font-weight: regular; }
h2 {font: 1.5em '#{font}', 'Lucida Grande', sans-serif; letter-spacing: 0; font-weight: regular; }
h3 {font: 1.5em '#{font}', 'Lucida Grande', sans-serif; font-weight: regular; }

p {margin-top: 0; margin-bottom: 1em;}
li { margin-bottom: .5em;}
code { font-size: 125%;}

.headline { border-bottom: 1px solid black; padding: .5em; margin: 0; background-color: #{palette[3]}; }
.headline h1 {margin: 0;}
.headline h2 {margin: 0;}
.headline a, a:visited { color: black; text-decoration: none; }
.headline a:hover { color: black; }

.main { padding: 1em 260px 1em 100px ; line-height: 1.25em; }
.main h1, .main h2, .main h3 {
  margin: 0 0 .25em -.5em; padding: .5em 1em .25em; background: #{palette[2]}; 
  border: 1px solid #{header_border};
  color: #{header_text};
}

.toc { float: right; position: fixed; right: 0px; top: 1em;
  width: 200px; margin: -1px 1em 0 0; padding: 0; 
  border-top: 1px solid black;
  border-left: 1px solid black;
  border-right: 1px solid black;
  }
.toc ul { padding:0; margin:0; }
.toc li { padding:0; margin:0; list-style-type:none; border-bottom: 1px solid black; }
.toc a , .toc a:visited { padding: .5em; text-decoration:none; display:block; color: blue; font-size: .8em;
  font-weight: bold;
  color: black; background: #{palette[0]} }
.toc a:hover { background: #{palette[1]}; }

.footer { text-align: center; font-size: .75em; border-top: 1px solid black; padding: .25em; background-color: #{palette[3]}; }

.sections { clear:left; }

.nav ul {
	margin-left: 0;
	padding-left: 0;
	display: inline;
	} 

.nav ul li {
	margin-left: 0;
	margin-bottom: 0;
	border: 1px solid #000;
	list-style: none;
	display: inline;
	background: #{palette[0]};
	}

.nav ul li:hover { 	background: #{palette[1]}; }
	
.nav ul li a { 	padding: 2px 15px 5px; text-decoration: none; }
	
.nav ul li.here {
	border-bottom: 1px solid #ffc;
	list-style: none;
	display: inline;
	}


    STYLE
  end
  
  def body_content
    headline
    toc
    nav
    main
    footer
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
    div :class => "nav" do
      ul do
        li { a 'About', :href => "/about" }
        li { a 'Learn Ruby', :href => "/learn_ruby" }
      end
    end
  end

  def toc
    div :class => "toc" do
      sections.each do |section|
        li do
          widget section, {}, {:content_method_name => :as_toc}
        end
      end
    end
  end

  def main
    div :class => "main" do
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
      end
      p do
        text "This site uses "
        a "Sansation", :href => "http://www.fontsquirrel.com/fonts/Sansation"
        text " by "
        text "Bernd Montag"
      end
      
    end
  end
end
