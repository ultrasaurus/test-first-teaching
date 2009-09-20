#Welcome to Test-First Teaching!

**Test-First Teaching** follows the example of Test-Driven Development (see below), but with an educational twist. In Test-First Teaching, the student begins with a single unit test (written by the teacher). In order to implement the test, the student has to create source code from scratch. The student then tries to compile and run the test; if the test cannot compile, or if the test runs and fails, then the student must go and fix his error. He then moves on to the next test in the lesson. 

## Why Test-First Teaching?

In traditional programming exercises, you are either given a fairly large task and asked to implement the whole thing, or you are provided with "skeleton code" -- source code that has been eviscerated to remove key sections, which you are asked to fill in.

"Large task" exercises are often challenging to students because of their sheer size. Many lines of code need to be written before you receive any positive reinforcement. This can be frustrating to beginners, and boring for advanced students.

"Skeleton code" exercises are also frustrating. The task of the student should be to figure out how to write code that will accomplish the given task. With skeleton code, you are first presented with the task of figuring out what the original author was trying to do; of reading through the code (often littered with idiosyncratic idioms and obscure comments); and then of trying to implement just one part of the algorithm, without necessarily understanding the larger picture. If the fill-in-the-blank code section is too complicated, the student may never complete the assignment; if it's too simple, no learning may be gained by the exercise.

Finally, in both types of traditional exercises, as a student you don't really know when you are finished! Sometimes, you will succeed in the task, but neglect to print the results, and will keep at it, believing you are still missing something; other times, you might write code that seems to work but is crucially flawed in some way or another. This is one of the most powerful features of test-first development -- you code until the test passes, and then you stop coding. The test provides a map, informing you of where to begin, and where to end.

Test-first teaching is appropriate for both local and remote use. Students in a classroom may rely on classmates or teachers for guidance; but if alone, the tests provide some measure of feedback and guidance (although unit tests can never actually debug and fix the code).

Perhaps the most important aspect of test-first teaching is that it teaches the whole process, from opening a new file in a text editor to compiling and running. At the end of the day, the students can say, "At least I know how to write a program." Many exercises, especially skeletons but also those based on tools and toy problems, end up skipping the fundamentals that are vital not just for coding on a day-to-day basis, but also for cementing the higher-level concepts into habits and skills. 

## What is Unit Testing and Test-Driven Development (TDD)?
**Unit Testing** refers to writing a set of functions that sit next to a given module of program code. These functions run a series of tests that assure, more-or-less thoroughly, that the program code performs as it is supposed to.

For example, assume there is a function called add that takes two integers as parameters, adds them together, and returns their sum. There might be one unit test that calls add with 2 and 3, and makes sure the result is 5. There might be additional unit tests that "push the envelope" in various other ways, testing its behavior with large numbers, negative numbers, illegal parameters (e.g. strings), and so forth.

Once a full suite of unit tests is developed, it is good practice to run these tests as often as possible.

**Test-First Development** (sometimes called **Test-Driven Development** or **Test-Driven Design**) is the practice of writing the unit tests first, before you write a single line of implementation code. While this may seem like putting the cart before the horse, there are several good reasons why you might want to do this:

1. It forces you to think first about the design of the interface to the code, instead of jumping straight to the implementation. Having a well-designed interface is often more important than having an efficient implementation.
2. Writing tests is often seen as a chore; writing the tests first guarantees that at the end of the day you will have written a suite of unit tests (rather than leaving them until the end and possibly never getting around to it).
3. If you apply a tight cycle of write one test, then write the code to implement that test, then write the next test, your code ends up growing organically. This often (though not always) leads to less wasted effort; you end up writing all the code you need, and none of the code you don't need.

A **Testing Framework** is a tool or library that provides a backdrop for writing tests. For example, to implement a test in the popular JUnit framework, you write a class that extends the common TestCase superclass. Each method in your subclass that begins with the word "test" is a separate unit test. You then run the JUnit tool (both graphical and text versions are provided) and it loads your class and executes each test method in turn, monitoring the results and providing feedback.  There are several testing frameworks in use for Ruby today:

* Test::Unit, almost identical to JUnit. is included with Ruby
* shoulda, which can be used as an extension Test::Unit, provides more readable tests and allows you to write less test code
* RSpec, which is used in this project, has more concise syntax and can be used in the same project, but creates a separate suite of tests, called "specs"

## Setup

* Check out the git repository

        git clone git://github.com/ultrasaurus/test-first-teaching.git

* Install RSpec

        sudo gem install rspec

* Configure RSpec (optional). If you're running a bash shell, you can put the following in your .bash_profile to make the output a bit nicer.

        alias spec="spec --color --format nested"

## Setup again

If you work for a while and then notice that this repository has changed and you want the new stuff:

View the "status" and make sure you have nothing modified

        git status

Add a reference to the remote repository

        git remote add ultrasaurus git://github.com/ultrasaurus/test-first-teaching

Pull down the remote repository's master branch. This creates a local branch called `ultrasaurus/master`

        git pull ultrasaurus master

Now merge the `ultrasaurus/master` stuff into your `master` branch

        git merge ultrasaurus/master

Finally push your own `master` branch back to your `origin` remote github repository.

        git push origin master

If you want to understand all the magical git encantations, watch this great screencast: [http://www.gitcasts.com/posts/railsconf-git-talk](http://www.gitcasts.com/posts/railsconf-git-talk)

## How To Use These Exercises

Each directory has a spec file. You will write all the code to make it pass. 

To walk through this process there are detailed instructions in the index.md file in the "hello" directory.

## Related Projects

* [Ruby Koans](http://github.com/edgecase/ruby_koans)
* [Ruby Mission](http://github.com/alexch/mission)
* [RailsBridge](http://groups.google.com/group/railsbridge)
* [Test-Driven](http://www.slideshare.net/alexchaffee/test-driven) presentation by Alex

## Credits

* Concept by Alex Chaffee
* Exercises by Alex Chaffee, Sarah Allen
* Early quality assurance by Sumiki, Dimitri, Liah, Michael, and Brendan

