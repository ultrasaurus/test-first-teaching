here = File.expand_path(File.dirname(__FILE__))

require "erector"
require "rdiscount"
require "#{here}/ext"
require "#{here}/section"
require "#{here}/nav"

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
    nav_width = 16 # em
    
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

.main { padding: 1em 100px 1em #{nav_width+3}em; line-height: 1.25em; min-height: 20em; }

.main h1, .main h2, .main h3 {
  margin: 0 0 .25em -.5em; padding: .5em 1em .25em; background: #{palette[2]}; 
  border: 1px solid #{header_border};
  color: #{header_text};
}

.footer { text-align: center; font-size: .75em; border-top: 1px solid black; padding: .25em; background-color: #{palette[3]}; }

.nav {float: left; margin: 1em; border: 1px solid #000; background: #{palette[0]}; width: #{nav_width}em;}

.nav ul {margin: 0; padding: .25em;} 

.nav ul li {margin: .15em; list-style: none;}
.nav ul li ul li {font-size: .75em;}

.nav ul li a:hover { 	background: #{palette[1]}; }	
.nav ul li a { 	padding: .15em 15px; text-decoration: none; }


    STYLE
  end
  
  def body_content
    headline
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
    widget Nav, :current_page => self.class
  end
  
  def name
    self.class.name # todo: titleize
  end
  
  def page_id
    self.class.name.downcase #todo: underscore
  end
  
  def new_section(opts)
    Section.new(opts.merge({:page_id => page_id}))
  end
  
  def sections
    []
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
