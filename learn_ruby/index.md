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

If you want to understand all the magical git incantations, watch this great screencast: [http://www.gitcasts.com/posts/railsconf-git-talk](http://www.gitcasts.com/posts/railsconf-git-talk)

## How To Use These Exercises

Each directory has a spec file. You will write all the code to make it pass. 

To walk through this process there are detailed instructions in the index.md file in the "hello" directory.

## Related Projects

* [Ruby Koans](http://github.com/edgecase/ruby_koans)
* [Ruby Mission](http://github.com/alexch/mission)
* [RailsBridge](http://groups.google.com/group/railsbridge)
* [Test-Driven](http://www.slideshare.net/alexchaffee/test-driven) presentation by Alex
* [CS Unplugged](http://www.csunplugged.org/)
* [Growing OO Software In Ruby](http://www.exampler.com/blog/2009/12/17/growing-object-oriented-software-in-ruby/)
* [Ruby Learning](http://rubylearning.com/satishtalim/tutorial.html)
* [ruby-warrior](http://github.com/ryanb/ruby-warrior)

## Credits

* Concept by Alex Chaffee
* Exercises by Alex Chaffee, Sarah Allen
* Early quality assurance by Sumiki, Dimitri, Liah, Michael, and Brendan

