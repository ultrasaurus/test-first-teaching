require "page"

class About < Page
  
  def name
    "About Test-First Teaching"
  end
  
  def main_title
    h1 name
  end
  
  def sections
    [
      new_section(:name => "Why Test-First Teaching?", :text => <<-MARKDOWN),
  Test-First Teaching provides a fundamental shift in the way people learn software development. Initially, it helps the student focus on learning very basic syntax, able to independently confirm when they have successfully completed an exercise.  That immediate feedback is valuable for cementing knowledge.

  Test-first teaching also teaches an understanding of all of the arcane error messages in a low stress situation.  The first thing you see, before you have written a line of code, is an error.  Then you discover what you need to do to fix that error. Test-first teaching helps people intuitively understand that mistakes are a natural part of the software development process.

  In traditional programming exercises, you are either given a fairly large task and asked to implement the whole thing, or you are provided with "skeleton code" -- source code that has been eviscerated to remove key sections, which you are asked to fill in.

  "Large task" exercises are often challenging to students because of their sheer size. Many lines of code need to be written before you receive any positive reinforcement. This can be frustrating to beginners, and boring for advanced students.

  "Skeleton code" exercises are also frustrating. The task of the student should be to figure out how to write code that will accomplish the given task. With skeleton code, you are first presented with the task of figuring out what the original author was trying to do; of reading through the code (often littered with idiosyncratic idioms and obscure comments); and then of trying to implement just one part of the algorithm, without necessarily understanding the larger picture. If the fill-in-the-blank code section is too complicated, the student may never complete the assignment; if it's too simple, no learning may be gained by the exercise.

  Finally, in both types of traditional exercises, as a student you don't really know when you are finished! Sometimes, you will succeed in the task, but neglect to print the results, and will keep at it, believing you are still missing something; other times, you might write code that seems to work but is crucially flawed in some way or another. This is one of the most powerful features of test-first development -- you code until the test passes, and then you stop coding. The test provides a map, informing you of where to begin, and where to end.

  Test-first teaching is appropriate for both guided and solo use. Students in a classroom may rely on classmates or teachers for guidance; but if alone, the tests provide some measure of feedback and guidance (although unit tests can never actually debug and fix the code).

  Perhaps the most important aspect of test-first teaching is that it teaches the whole process, from opening a new file in a text editor to compiling and running. At the end of the day, the students can say, "At least I know how to write a program." Many exercises, especially skeletons but also those based on tools and toy problems, end up skipping the fundamentals that are vital not just for coding on a day-to-day basis, but also for cementing the higher-level concepts into habits and skills. 

  MARKDOWN

      new_section(:name => "Unit Testing", :text => <<-MARKDOWN),
  **Unit Testing** refers to writing a set of functions that sit next to a given module of program code. These functions run a series of tests that assure, more-or-less thoroughly, that the program code performs as it is supposed to.

  For example, assume there is a function called add that takes two integers as parameters, adds them together, and returns their sum. There might be one unit test that calls add with 2 and 3, and makes sure the result is 5. There might be additional unit tests that "push the envelope" in various other ways, testing its behavior with large numbers, negative numbers, illegal parameters (e.g. strings), and so forth.

  Once a full suite of unit tests is developed, it is good practice to run these tests as often as possible.
      MARKDOWN

      new_section(:name => "Test-Driven Development", :anchor_name => "tdd", :text => <<-MARKDOWN),

  **Test-Driven Development** (sometimes called Test-First Development or Test-Driven Design) is the practice of writing the unit tests first, before you write a single line of implementation code. While this may seem like putting the cart before the horse, there are several good reasons why you might want to do this:

  1. **Design**. It forces you to think first about the design of the interface to the code, instead of jumping straight to the implementation. Having a well-designed interface is often more important than having an efficient implementation.
  2. **Discipline**. Writing tests is often seen as a chore; writing the tests first guarantees that at the end of the day you will have written a suite of unit tests (rather than leaving them until the end and possibly never getting around to it).
  3. **Less Work**. If you apply a tight cycle of write one test, then write the code to implement that test, then write the next test, your code ends up growing organically. This often (though not always) leads to less wasted effort; you end up writing all the code you need, and none of the code you don't need.
      MARKDOWN

      new_section(:name => "Testing Frameworks", :text => <<-MARKDOWN),
  A **Testing Framework** is a tool or library that provides a backdrop for writing tests. 
  
  For example, to implement a test in the JUnit framework for Java, you write a class that extends the common TestCase superclass. Each method in your subclass that begins with the word "test" is a separate unit test. You then run the JUnit tool (both graphical and text versions are provided) and it loads your class and executes each test method in turn, monitoring the results and providing feedback.
  
  Using RSpec for Ruby, you use the keywords `describe` and `it` to build a nested set of tests (also called "specs" or "examples" in the RSpec lexicon).

  There are several testing frameworks in use for Ruby today:

  * `Test::Unit` is included with Ruby 1.8, and follows the "xUnit" conventions
  * `Minitest` is included with Ruby 1.9, and allows both xUnit and RSpec style tests
  * `RSpec`, which is used in this project, has more concise syntax and can be used in the same project, but creates a separate suite of tests, called "specs"
  * in `Cucumber`, tests are written not in Ruby but in a language designed for tests

  There are also many testing libraries which can be used inside any of the frameworks listed above:
  
  * [Wrong](http://github.com/sconover/wrong) provides a universal `assert` (or `expect`) that inspects your code and automatically tells you details of why it failed
  * [shoulda](https://github.com/thoughtbot/shoulda) provides a "chaining DSL" for representing assertions, similar to RSpec
  * `rr` is a Mock Object library
  
      MARKDOWN

      new_section(:name => "Join the Conversation", :text => lambda do
        p do
          text 'Join our '
          a :href => 'http://groups.google.com/group/test-first-teaching' do
            text 'test-first teaching mailing list'
          end
          text '.'
        end
        p do
          text "To contribute lessons (or see solutions), check out the "
          a "test-first-teaching", href: "http://github.com/ultrasaurus/test-first-teaching"
          text " github repo."
        end
      end),
    ]
  end
end

