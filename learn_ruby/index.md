# Learn Ruby Test-First

## Setup

* Install Ruby

  * You will need Ruby, RubyGems and RSpec to Learn Ruby.
  * We recommend using [rvm](http://rvm.beginrescueend.com) but you can use any Ruby you want. We officially support Ruby 1.9 but probably work with 1.8.7 as well.
  * Here are some [good instructions](http://www.wiki.devchix.com/index.php?title=Workshop_Installation_Notes_Rails_3) for installing the required software.
  * Here are some [other good instructions](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book#sec:rubygems), using rvm.

* Install RSpec

        gem install rspec

  * Configure RSpec (optional). If you're running a bash shell, you can put the following in your .bash_profile to make the output a bit nicer.

            alias spec="spec --color --format nested"

* Open a terminal window. (On Mac OS X you can use the `Terminal` app.)

* Enter the course directory. (That's the same directory that this `index.html` file is in.)

        cd learn_ruby


## Using These Exercises

Your course directory has a list of chapter directories. Each
directory has a spec file. You will write all the code to make all the specs
in it pass.

To get your feet wet in this process, go into the "hello" chapter with `cd
00_hello` and read the detailed instructions in its `index.html` file.

If you got through "hello", then congratulations! Now it's time to go to the
next directory (whose name begins with `01_`) and start learning Ruby!

## Course Outline

Each course is different, so check with your instructor for details on the
curriculum he or she has chosen. Here is a survey of a few of the chapters:

* **hello**
  Gives you a feel for how to use these tests.
  See [00_hello/index.html](00_hello/index.html) for detailed instructions.
* **temperature**
  Write and class and do some basic math.
* **calculator** introduces a little more math, and you'll need to iterate.
* **pig\_latin** lets you manipulate strings.
* **in\_words** asks a number to say itself in English. Extend a built-in class. By the end you'll use conditionals, arrays, iteration, and maybe even some recursion.
* **blocks** introduces block syntax, including `yield`

# Advanced Setup

After you're in the swing of things, you can read about [advanced setup techniques](advanced_setup.html) like pulling changes and forking. But don't worry about it at first.

# Problems? Questions?

First, ask your neighbor. Then, ask your instructor.

Then ask Google (seriously!). If there's an error, try copying the error string and pasting it into a [Google](http://google.com) search box. If that doesn't help, do a search on one of these sites:

*	<http://stackoverflow.com/>
*	<http://www.ruby-forum.com>

You can also find help at the [TestFirst.org](http://testfirst.org) site or the [Test-First Teaching mailing list](http://groups.google.com/group/test-first-teaching).

Remember, if you post a technical question online, you should

1. Include version numbers:

        $ ruby -v
        ruby 1.8.6 (2008-08-11 patchlevel 287) [universal-darwin9.0]

2. Note where you have already looked for an answer
3. If you can, include code snippets that reproduce the problem in isolation

# Resources

Here is a broad survey of many resources you may find useful. Don't try to read them all! Just browse around when you feel like learning more about Ruby.

## Learning Ruby via Tests
* [Ruby Koans](http://rubykoans.com) by Jim Weirich and Joe O'Brien (inspired by [Metakoans](http://rubyquiz.com/quiz67.html) by ara.t.howard and [Ruby Learning Tests](http://clarkware.com/cgi/blosxom/2005/03/18) by Mike Clark)
* [Test-First Teaching](http://testfirst.org) by Sarah Allen and Alex Chaffee
  * [Learning TDD Through Test First Teaching](http://www.youtube.com/watch?v=KgfdlZuVz7I) talk by Sarah Allen at East Bay Ruby Meetup
* [Growing OO Software In Ruby](http://www.exampler.com/blog/2009/12/17/growing-object-oriented-software-in-ruby/) by Brian Marick - a Ruby version of [Growing Object-Oriented Software Guided by Tests](http://www.growing-object-oriented-software.com/)
* [ruby-warrior](http://github.com/ryanb/ruby-warrior) by Ryan Bates - a game written in Ruby for learning Ruby

## Learning Ruby and Programming
* [Learn To Program](http://pine.fm/LearnToProgram/) by **Chris Pine** - great Ruby tutorial, available online (1st ed.) or in a [PragProg book](http://www.pragprog.com/titles/ltp2/learn-to-program-2nd-edition) (2nd ed.)
* [Ruby Learning](http://rubylearning.com/satishtalim/tutorial.html) - Ruby tutorial
* [Try Ruby](http://tryruby.org) runs a Ruby interpreter in your browser, with hints and advice
* [Rails for Zombies](http://railsforzombies.org) - learn Ruby and Rails in your browser, no setup required
* [Read Ruby](http://ruby.runpaint.org/) a book about Ruby, quite technical but well written. Free online.
* [Ruby Mission](http://github.com/alexch/mission)
* [RailsBridge](http://groups.google.com/group/railsbridge)
* [CS Unplugged](http://www.csunplugged.org/) - "CS Unplugged provides an extensive collection of free resources that teach principles of Computer Science such as binary numbers, algorithms and data compression through engaging games and puzzles that use cards, string, crayons and lots of running around."
* [Everyday Scripting with Ruby](http://pragprog.com/titles/bmsft/everyday-scripting-with-ruby) by Brian Marick
* [Programming Ruby (the Pick Axe)](http://pragprog.com/titles/ruby/programming-ruby) by Dave Thomas
* Nice User's Guide: <http://www.rubyist.net/~slagell/ruby/>
* Michael Hartl's [Rails Tutorial](http://railstutorial.org)
* <http://ruby4kids.com>
* [Ruby in 100 Minutes](http://jumpstartlab.com/resources/ruby-jumpstart/ruby/) by [Jeff Casimir](http://jumpstartlab.com)
* [Ruby Mendicant University](http://university.rubymendicant.com)
* Trainer on Rails ["Ruby For Rails" tutorial](http://www.public.traineronrails.com/courses/ruby/)
* ["My 10 Favorite Things About Ruby"](http://yehudakatz.com/2009/08/24/my-10-favorite-things-about-the-ruby-language/) by Yehuda Katz

## Test-Driven Development
* [Test-Driven](http://www.slideshare.net/alexchaffee/test-driven) - presentation by Alex

## Online Ruby References

* <http://www.ruby-lang.org>
*	<http://www.ruby-doc.org/>
*	<http://www.gotapi.com/rubyrails>
*	<http://apidock.com/>

## Other good resources

*	`irb` - when in doubt, try it out!
*	[Ruby Version Manager](http://rvm.beginrescueend.com/) (aka `rvm`) - cleanly manages multiple Ruby installations
*	<http://www.rubular.com/> - an online Ruby regular expression calculator

# Credits

* Concept by Alex Chaffee
* Exercises by Alex Chaffee, Sarah Allen, Liah Hansen, Kai Middleton
* Early quality assurance by Sumiki, Dimitri, Liah, Michael, and Brendan

