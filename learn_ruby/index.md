# Instructions


## Setup

* Install Ruby

  * Here are some [good instructions](http://www.wiki.devchix.com/index.php?title=Workshop_Installation_Notes_Rails_3)
for installing the required software.  You will need Ruby, RubyGems and RSpec to Learn Ruby.
  * We recommend using [rvm](http://rvm.beginrescueend.com) but you can use any Ruby you want. We officially support Ruby 1.9 but probably work with 1.8.7 as well.

* Install RSpec

        gem install rspec

  * Configure RSpec (optional). If you're running a bash shell, you can put the following in your .bash_profile to make the output a bit nicer.

            alias spec="spec --color --format nested"

* Clone the course repository

        git clone git://github.com/alexch/learn_ruby.git

* Enter the course directory

        cd learn_ruby
        

## Using These Exercises

Your course directory (cloned repo) has a list of chapter directories. Each
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
  See [hello/index.html](hello/index.html) for detailed instructions.
* **temperature**
  Write and class and do some basic math.
* **calculator** introduces a little more math, and you'll need to iterate.
* **pig\_latin** lets you manipulate strings.
* **in\_words** asks a number to say itself in English. Extend a built-in class. By the end you'll use conditionals, arrays, iteration, and maybe even some recursion.
* **blocks** introduces block syntax, including `yield`

## Pulling changes

If you've been working for a while and then notice that the course repository has changed and you want the new stuff:

* View the "status" and make sure you have nothing modified

        git status

* Pull the changes

        git pull origin master

## Forking (not cloning)

To save a copy of your own solutions on your own github repo, you'll have to "fork" the course on Github. This will give you a new git url of your very own, which you can then clone as above. For instance, if your github name is `ladyhaha`, your clone command is

        git clone git://github.com/ladyhaha/learn_ruby.git

To pull changes into this new repo is a little tricky and you should probably ask for help before doing it, but here's the instructions.

* Add a reference to the original remote repository

        git remote add ultrasaurus git://github.com/ultrasaurus/learn_ruby

* Pull down the remote repository's master branch. This creates a local branch called `ultrasaurus/master`

        git pull origin master

* Now merge the `ultrasaurus/master` stuff into your `master` branch

        git merge ultrasaurus/master

* Finally push your own `master` branch back to your `origin` remote github repository.

        git push origin master

If you want to understand all these magical git incantations, watch this great screencast: <http://blip.tv/file/4094854> (more at <http://www.gitcasts.com>)

# Resources

## Learning Ruby via Tests
* [Ruby Koans](http://rubykoans.com) by Jim Weirich and Joe O'Brien (inspired by Metakoans and Ruby Learning Tests)
    * [Metakoans](http://rubyquiz.com/quiz67.html) by ara.t.howard
    * [Ruby Learning Tests](http://clarkware.com/cgi/blosxom/2005/03/18) by Mike Clark
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

## When you have a question...

First, search for the answer (keywords, exact error string)

*	[Google](http://google.com)
*	<http://www.ruby-forum.com>
*	<http://stackoverflow.com/>

If you didn't find the answer and you need to ask your question:

1. Include version numbers: <pre>
    $ ruby -v
    ruby 1.8.6 (2008-08-11 patchlevel 287) \[universal-darwin9.0\]
</pre>
2. Note where you have already looked for an answer
3. If you can, include code snippets that reproduce the problem in isolation

## Other good resources

*	`irb` - when in doubt, try it out!
*	[Ruby Version Manager](http://rvm.beginrescueend.com/) (aka `rvm`) - cleanly manages multiple Ruby installations
*	<http://www.rubular.com/> - an online Ruby regular expression calculator

# Credits

* Concept by Alex Chaffee
* Exercises by Alex Chaffee, Sarah Allen, Liah Hansen, Kai Middleton
* Early quality assurance by Sumiki, Dimitri, Liah, Michael, and Brendan

