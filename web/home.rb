require "erector"

class Home < Erector::Widgets::Page
  def topic(s)
    strong s
    text ' '
  end

  def stylesheet(href)
    link :rel=>"stylesheet", :type=>"text/css", :href=> href
  end

  def head_content
    stylesheet "ChunkFive/stylesheet.css"
    style <<-STYLE
body {font-size:100%;
  font-family: 'Lucida Grande', Verdana, Arial, Helvetica, sans-serif;
  padding: 0; margin: 0;
}
h1 {font: 2.5em 'ChunkFiveRegular', 'LucidaGrande', sans-serif; letter-spacing: 0; line-height: 0;}
h2 {font: 1.5em 'ChunkFiveRegular', 'LucidaGrande', sans-serif; letter-spacing: 0; line-height: 0; margin: 0}
h3 {font: 1.5em 'ChunkFiveRegular', 'LucidaGrande', sans-serif;  }

p {margin-top: 0; margin-bottom: 1em;}
li { margin-bottom: .5em;}

.headline { border-bottom: 1px solid black; padding: .5em; margin: 0; background-color: #E2FDEB; }
.main { padding: 1em;}
    STYLE
  end

  def body_content
    div :class => "headline" do
      h1 do
        text 'TestFirst.org'
      end
      h2 "the home of test-first teaching"    
    end

    div :class => "main" do

      p do
        text 'This website provides a path to learning Ruby through self-guided exercises that use a software test framework.  This methodology is called "Test First Teaching" and has been applied successfully in a classroom environment.'
      end
      p do
        topic 'Test-First Teaching'
        text 'follows the example of '
        a :href => '#tdd' do
          text 'Test-Driven Development'
        end
        text ', but with an educational twist. In Test-First Teaching, the student begins with a single unit test (written by the teacher). In order to implement the test, the student has to create source code from scratch. The student then tries to compile and run the test; if the test cannot compile, or if the test runs and fails, then the student must go and fix his error. He then moves on to the next test in the lesson.'
      end
      p do
        text 'Test-First Teaching provides a fundamental shift in the way people learn software development. Initially, it helps the student focus on learning very basic syntax, able to independently confirm when they have successfully completed an exercise.  That immediate feedback is valuable for cementing knowledge.  Test-first teaching also teaches an understanding of all of the arcane error messages in a low stress situation.  The first thing you see, before you have written a line of code, is an error.  Then you discover what you need to do to fix that error.Test-first teaching helps people intuitively understand that mistakes are a natural part of the software development process.'
      end
      p do
        text 'Perhaps the most important aspect of test-first teaching is that it guides the student through the whole process, from opening a new file in a text editor to compiling and running. At the end of the day, the student knows that he or she has successfully written a program that meets the requirements.'
      end
      p do
        a :name => 'tdd' do
          topic 'Test-First Development'
        end
        text '(sometimes called Test-Driven Development or Test-Driven Design) is the practice of writing the unit tests first, before you write a single line of implementation code. While this may seem like putting the cart before the horse, there are several good reasons why you might want to do this:'
      end
      ol do
        li do
          topic 'Design'
          text 'It forces you to think first about the design of the interface to the code, instead of jumping straight to the implementation. Having a well-designed interface is often more important than having an efficient implementation.'
        end
        li do
          topic 'Project Management'
          text ' If you apply a tight cycle of write one test, then write the code to implement that test, then write the next test, your code ends up growing organically. This often (though not always) leads to less wasted effort; you end up writing all the code you need, and none of the code you don\'t need.'
        end
        li do
          topic 'Creation of Tests'
          text ' Writing tests is often seen as a chore; writing the tests first guarantees that at the end of the day you will have written a suite of unit tests (rather than leaving them until the end and possibly never getting around to it).'
        end
      end
      h3 do
        text 'Join the Conversation'
      end
      p do
        text 'Join our '
        a :href => 'http://groups.google.com/group/test-first-teaching' do
          text 'google group'
        end
      end
      h3 do
        text 'Installation'
      end
      p do
        text 'Here are some '
        a :href => 'http://wiki.devchix.com/index.php?title=Workshop_Installation_Notes' do
          text 'good instructions'
        end
        text ' for installing the required software.  You will need Ruby, RubyGems and Rspec to Learn Ruby.'
      end
      h3 do
        text 'Download'
      end
      ul do
        li do
          a :href => '/pkg/learn_ruby-1.0.0.zip' do
            text 'Learn Ruby'
          end
        end
      end
    end
  end
end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
