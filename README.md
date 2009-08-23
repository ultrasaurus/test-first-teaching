#Welcome to Test-First Teaching!

## Credits

* Concept by Alex Chaffee
* Exercises by Alex Chaffee, Sarah Allen
* Early quality assurance by Sumiki, Dimitri, Liah, Michael, and Brendan

## What is Test-First Teaching?

See intro.html (currently it applies to the Java version of these lessons)

## Setup

* Check out the git repository

        git clone git://github.com/ultrasaurus/test-first-teaching.git

* Install RSpec

        sudo gem install rspec

* Configure RSpec (optional). If you're running a bash shell, you can put the following in your .bash_profile to make the output a bit nicer.

        alias spec="--color --format nested"

* Do the "hello" module.

        cd hello
        spec hello_spec.rb
        
When the Hello Spec fails, read the output, and then try to make it pass. If you're stuck, open up the index.md file in that directory for step-by-step instructions.

Here's your mantra: Make it pass! Don't be too ambitious... just work on one spec at a time.

## Next steps

After the "hello" module, do the modules in the order your instructor 

## FAQ

### What is RSpec?

"Spec" is another name for "test", and "RSpec" is a spec framework for Ruby.


