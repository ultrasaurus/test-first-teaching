# Learn JavaScript Test-First

# Setup

## Welcome!

* Open a terminal window. (On Mac OS X you can use the `Terminal` app.)

* Enter the course directory. (That's the same directory that this `index.html` file is in.)

        cd learn_javascript


## Install Ruby

First check if you have ruby already. Try this:

        ruby -v

If the response is something like this

        ruby 1.9.2p180 (2011-02-18 revision 30909) [x86_64-darwin10.7.0]

then skip ahead.

Otherwise...

* Windows: <http://railsinstaller.org/>
* Other systems: follow the instructions [here](http://www.wiki.devchix.com/index.php?title=Workshop_Installation_Notes_Rails_3) or [here](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book#sec:rubygems)

## Install Jasmine

Jasmine is a JavaScript testing framework. While Jasmine can be run from a plain HTML file, we are using the Jasmine Server, which comes as a "gem" (a Ruby program).

    gem install jasmine

# Learning

Your course directory has a list of lab directories. Each directory has a spec file. You will write all the code to make all the specs in it pass.

To get your feet wet in this process, go into the "hello" lab with `cd 00_hello` and read the detailed instructions in its [`index.html` file](00_hello/index.html).

Once you got through "hello", then congratulations! Now it's time to go to the
next directory (whose name begins with `01_`) and start learning JavaScript!

# Problems? Questions?

First, ask your neighbor. Then, ask your instructor.

Then ask Google (seriously!). If there's an error, try copying the error string and pasting it into a [Google](http://google.com) search box. If that doesn't help, do a search on one of these sites:

*	<http://stackoverflow.com/>

You can also find help at the [TestFirst.org](http://testfirst.org) site or the [Test-First Teaching mailing list](http://groups.google.com/group/test-first-teaching).

# Resources

* Interactive JavaScript Tutorials
  * [JavaScript Koans](https://github.com/mrdavidlaing/javascript-koans)
  * [Learning Advanced JavaScript](http://ejohn.org/apps/learn) by [John Resig](http://ejohn.org)
  * [Liah's Class](https://github.com/liahhansen/Learn-to-Program-Javascript)
  * [Happy Fun Coding](http://happyfuncoding.com/)

* [Jasmine](http://pivotal.github.com/jasmine/)
  * [An Introduction to JavaScript testing with Jasmine BDD](https://github.com/searls/jasmine-intro) - slide presentation with sample code
  * [Jasmine Review](http://blog.twoalex.com/2010/12/29/test-your-javascript/)
  * [Headless Testing for Continuous Integration with Git and Jasmine](http://www.sencha.com/blog/2011/01/14/headless-testing-for-continuous-integration-with-git-and-jasmine/)

* [Mozilla JavaScript Guide](http://developer.mozilla.org/en/JavaScript/Guide)
* [JavaScript Garden](http://bonsaiden.github.com/JavaScript-Garden/) - "a growing collection of documentation about the most quirky parts of the JavaScript programming language. It gives advice to avoid common mistakes, subtle bugs, as well as performance issues and bad practices that non-expert JavaScript programmers may encounter on their endeavours into the depths of the language."

