require "erector"
require "rdiscount"

class Erector::Widget
  def markdown(s)
    rawtext Markdown.new(s).to_html
  end
end

class Section < Erector::Widget
  needs :name, :text
  needs :aname => nil

  def initialize(opts)
    super
    @aname = @name.downcase.gsub(/[^a-z]/, '') unless @aname
  end
  
  def as_toc
    a @name, :href => "##{@aname}"
  end
  
  def content
    a :name => @aname
    h3 @name
    if @text.is_a? Proc
      @text.call
    else
      markdown @text
    end
  end  
end

class Home < Erector::Widgets::Page
  def topic(s)
    strong s
    text ' '
  end

  def stylesheet(href)
    link :rel=>"stylesheet", :type=>"text/css", :href=> href
  end

  def head_content
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

    STYLE
  end

  def body_content
    div :class => "headline" do
      h1 do
        a 'TestFirst.org', :href => "/"
      end
      h2 "the home of test-first teaching"    
    end

    div :class => "toc" do
      sections.each do |section|
        li do
          widget section, {}, {:content_method_name => :as_toc}
        end
      end
    end

    div :class => "main" do
      p 'This website provides a path to learning Ruby through self-guided exercises that use a software test framework.  This methodology is called "Test First Teaching" and has been applied successfully in a classroom environment.'
      
      div :class => "sections" do
        sections.each do |section|
          widget section
        end
      end
    end
    
    div :class => "footer" do
      p "TestFirst.org is a production of Sarah Allen, Alex Chaffee, and many other contributors."
    end
  end
  
  def sections
    [Section.new(:name => "Welcome to Test-First Teaching!", :text => lambda do
      p do
        topic 'Test-First Teaching'
        text 'follows the example of '
        a :href => '#tdd' do
          text 'Test-Driven Development'
        end
        text ', but with an educational twist. In Test-First Teaching, the student begins with a single unit test (written by the teacher). In order to implement the test, the student has to create source code from scratch. The student then tries to compile and run the test; if the test cannot compile, or if the test runs and fails, then the student must go and fix her error. She then moves on to the next test in the lesson.'
      end
    end),
    
    Section.new(:name => "Why Test-First Teaching?", :text => <<-MARKDOWN),
Test-First Teaching provides a fundamental shift in the way people learn software development. Initially, it helps the student focus on learning very basic syntax, able to independently confirm when they have successfully completed an exercise.  That immediate feedback is valuable for cementing knowledge.

Test-first teaching also teaches an understanding of all of the arcane error messages in a low stress situation.  The first thing you see, before you have written a line of code, is an error.  Then you discover what you need to do to fix that error. Test-first teaching helps people intuitively understand that mistakes are a natural part of the software development process.

In traditional programming exercises, you are either given a fairly large task and asked to implement the whole thing, or you are provided with "skeleton code" -- source code that has been eviscerated to remove key sections, which you are asked to fill in.

"Large task" exercises are often challenging to students because of their sheer size. Many lines of code need to be written before you receive any positive reinforcement. This can be frustrating to beginners, and boring for advanced students.

"Skeleton code" exercises are also frustrating. The task of the student should be to figure out how to write code that will accomplish the given task. With skeleton code, you are first presented with the task of figuring out what the original author was trying to do; of reading through the code (often littered with idiosyncratic idioms and obscure comments); and then of trying to implement just one part of the algorithm, without necessarily understanding the larger picture. If the fill-in-the-blank code section is too complicated, the student may never complete the assignment; if it's too simple, no learning may be gained by the exercise.

Finally, in both types of traditional exercises, as a student you don't really know when you are finished! Sometimes, you will succeed in the task, but neglect to print the results, and will keep at it, believing you are still missing something; other times, you might write code that seems to work but is crucially flawed in some way or another. This is one of the most powerful features of test-first development -- you code until the test passes, and then you stop coding. The test provides a map, informing you of where to begin, and where to end.

Test-first teaching is appropriate for both guided and solo use. Students in a classroom may rely on classmates or teachers for guidance; but if alone, the tests provide some measure of feedback and guidance (although unit tests can never actually debug and fix the code).

Perhaps the most important aspect of test-first teaching is that it teaches the whole process, from opening a new file in a text editor to compiling and running. At the end of the day, the students can say, "At least I know how to write a program." Many exercises, especially skeletons but also those based on tools and toy problems, end up skipping the fundamentals that are vital not just for coding on a day-to-day basis, but also for cementing the higher-level concepts into habits and skills. 

MARKDOWN

    Section.new(:name => "Unit Testing", :text => <<-MARKDOWN),
**Unit Testing** refers to writing a set of functions that sit next to a given module of program code. These functions run a series of tests that assure, more-or-less thoroughly, that the program code performs as it is supposed to.

For example, assume there is a function called add that takes two integers as parameters, adds them together, and returns their sum. There might be one unit test that calls add with 2 and 3, and makes sure the result is 5. There might be additional unit tests that "push the envelope" in various other ways, testing its behavior with large numbers, negative numbers, illegal parameters (e.g. strings), and so forth.

Once a full suite of unit tests is developed, it is good practice to run these tests as often as possible.
    MARKDOWN

    Section.new(:name => "Test-Driven Development", :aname => "tdd", :text => <<-MARKDOWN),

**Test-Driven Development** (sometimes called Test-First Development or Test-Driven Design) is the practice of writing the unit tests first, before you write a single line of implementation code. While this may seem like putting the cart before the horse, there are several good reasons why you might want to do this:

1. **Design**. It forces you to think first about the design of the interface to the code, instead of jumping straight to the implementation. Having a well-designed interface is often more important than having an efficient implementation.
2. **Discipline**. Writing tests is often seen as a chore; writing the tests first guarantees that at the end of the day you will have written a suite of unit tests (rather than leaving them until the end and possibly never getting around to it).
3. **Less Work**. If you apply a tight cycle of write one test, then write the code to implement that test, then write the next test, your code ends up growing organically. This often (though not always) leads to less wasted effort; you end up writing all the code you need, and none of the code you don't need.
    MARKDOWN

    Section.new(:name => "Testing Frameworks", :text => <<-MARKDOWN),
A **Testing Framework** is a tool or library that provides a backdrop for writing tests. For example, to implement a test in the popular JUnit framework, you write a class that extends the common TestCase superclass. Each method in your subclass that begins with the word "test" is a separate unit test. You then run the JUnit tool (both graphical and text versions are provided) and it loads your class and executes each test method in turn, monitoring the results and providing feedback.  

There are several testing frameworks in use for Ruby today:

* `Test::Unit` is included with Ruby 1.8
* `Minitest` is included with Ruby 1.9
* `shoulda`, which can be used as an extension Test::Unit, provides more readable tests and allows you to write less test code
* `RSpec`, which is used in this project, has more concise syntax and can be used in the same project, but creates a separate suite of tests, called "specs"
* in `Cucumber`, tests are written not in Ruby but in a language designed for tests
    MARKDOWN

    Section.new(:name => "Join the Conversation", :text => lambda do
      p do
        text 'Join our '
        a :href => 'http://groups.google.com/group/test-first-teaching' do
          text 'google group'
        end
      end
    end),
    
    Section.new(:name => "Download", :text => lambda do
      ul do
        li do
          a :href => '/pkg/learn_ruby-1.0.0.zip' do
            text 'Learn Ruby'
          end
        end
      end
    end),
    
    Section.new(:name => "Learn Ruby", :text => File.read("#{File.dirname(__FILE__)}/../learn_ruby/index.md")),
    
  ]
    
  end
end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
