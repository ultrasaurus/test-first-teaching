# Learn Ruby

# Instructions

## Installation

Here are some [good instructions](http://wiki.devchix.com/index.php?title=Workshop_Installation_Notes)
for installing the required software.  You will need Ruby, RubyGems and RSpec to Learn Ruby.

## Setup

* Check out the git repository

        git clone git://github.com/ultrasaurus/test-first-teaching.git

* Install RSpec

        sudo gem install rspec

* Configure RSpec (optional). If you're running a bash shell, you can put the following in your .bash_profile to make the output a bit nicer.

        alias spec="spec --color --format nested"

## Setup again

If you work for a while and then notice that this repository has changed and you want the new stuff:

* View the "status" and make sure you have nothing modified

        git status

* Add a reference to the remote repository

        git remote add ultrasaurus git://github.com/ultrasaurus/test-first-teaching

* Pull down the remote repository's master branch. This creates a local branch called `ultrasaurus/master`

        git pull ultrasaurus master

* Now merge the `ultrasaurus/master` stuff into your `master` branch

        git merge ultrasaurus/master

* Finally push your own `master` branch back to your `origin` remote github repository.

        git push origin master

If you want to understand all the magical git incantations, watch this great screencast: <http://www.gitcasts.com/posts/railsconf-git-talk>

## How To Use These Exercises

Each directory has a spec file. You will write all the code to make it pass. 

To walk through this process there are detailed instructions in the `index.md` file in the "hello" directory.

## Outline

* **hello** 
  gives you a feel of how to use these tests and you will write your first class.  See [hello/index.md](hello/index.md) for detailed instructions.
* **temperature**
  Write another class and do some basic math.
* **calculator** introduces a little more math, and you'll need to iterate.
* **pig\_latin** lets you manipulate strings.
* **in\_words** asks a number to say itself in English. Extend a built-in class. By the end you'll use conditionals, arrays, iteration, and maybe even some recursion.
* **blocks** introduces block syntax, including `yield`

# Resources

### Learning Ruby via Tests
* [Test-First Teaching](http://testfirst.org) by Sarah Allen and Alex Chaffee
* [Ruby Koans](http://rubykoans.com) by Jim Weirich and Joe O’Brien
* [Growing OO Software In Ruby](http://www.exampler.com/blog/2009/12/17/growing-object-oriented-software-in-ruby/) by Brian Marick - Ruby version of [Growing Object-Oriented Software Guided by Tests](http://www.growing-object-oriented-software.com/)
* something by Yehuda Katz
* [ruby-warrior](http://github.com/ryanb/ruby-warrior) by Ryan Bates - a game written in Ruby for learning Ruby

### Learning Ruby and Programming
* [Learn To Program](http://pine.fm/LearnToProgram/) by Chris Pine - great Ruby tutorial, available online (1st ed.) or in a [PragProg book](http://www.pragprog.com/titles/ltp2/learn-to-program-2nd-edition) (2nd ed.)
* [Ruby Learning](http://rubylearning.com/satishtalim/tutorial.html) - Ruby tutorial
* [Try Ruby](http://tryruby.org) runs a Ruby interpreter in your browser, with hints and advice
* [Ruby Mission](http://github.com/alexch/mission)
* [RailsBridge](http://groups.google.com/group/railsbridge)
* [CS Unplugged](http://www.csunplugged.org/) - "CS Unplugged provides an extensive collection of free resources that teach principles of Computer Science such as binary numbers, algorithms and data compression through engaging games and puzzles that use cards, string, crayons and lots of running around."
* [Everyday Scripting with Ruby](http://pragprog.com/titles/bmsft/everyday-scripting-with-ruby) by Brian Marick
* [Programming Ruby (the Pick Axe)](http://pragprog.com/titles/ruby/programming-ruby) by Dave Thomas
* [learn to program](http://github.com/liahhansen/learn-to-program) by Liah Hansen
* Nice User’s Guide: http://www.rubyist.net/~slagell/ruby/

### Test-Driven Development
* [Test-Driven](http://www.slideshare.net/alexchaffee/test-driven) - presentation by Alex

## Online Ruby References

* <http://www.ruby-lang.org>
*	<http://www.ruby-doc.org/>
*	<http://www.gotapi.com/rubyrails>
*	<http://apidock.com/>

## When you have a question...

First, search for the answer (keywords, exact error string)

*	Google
*	http://www.ruby-forum.com 
*	http://stackoverflow.com/ 

If you didn’t find the answer and you need to ask your question:

1. Include version numbers:
    $ ruby -v
    ruby 1.8.6 (2008-08-11 patchlevel 287) \[universal-darwin9.0\]
2. Note where you have already looked for an answer
3. If you can, include code snippets that reproduce the problem in isolation

## Other good resources

*	Regular expressions: <http://www.rubular.com/>
*	irb  

# Credits

* Concept by Alex Chaffee
* Exercises by Alex Chaffee, Sarah Allen, Liah Hansen, Kai Middleton
* Early quality assurance by Sumiki, Dimitri, Liah, Michael, and Brendan

