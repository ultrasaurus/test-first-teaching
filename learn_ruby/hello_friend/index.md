# Hello, friend!

This lab teaches basic Ruby Object syntax.

## Open a terminal in this directory

    cd *_hello_friend

This directory is the starting point for this exercise. It contains a spec file and you'll be adding a ruby file to (eventually) make the specs pass.

## Run the test

    rake

## Watch it fail

You should see an error. **Don't get scared!** Try to read it and figure out what the computer wants to tell you. Somewhere on the first line it should say something like

    no such file to load -- test-first-teaching/hello_friend/friend (LoadError)

That means that it is looking for a file called `friend.rb` and can't find it.

## Create friend.rb

Open up `friend.rb` in a text editor. Save it. Run the test again.

    rake

## Watch it fail

Now you should see an error like this:

    ./friend_spec.rb:3: uninitialized constant Friend (NameError)

## Create the Friend class

Fix this by opening `friend.rb` and creating an empty class:

    class Friend
    end

Save it. Run the test again.

## Watch it fail

Now you should see an error like this:

    $ rake
    F

    1)
    NoMethodError in 'Friend says hello'
    undefined method `greeting' for #<Friend:0x1180f3c>
    ./friend_spec.rb:5:

    Finished in 0.002132 seconds

    1 example, 1 failure

This means that while it found the file, and it found the class, it couldn't find the method named "greeting".

## Define the "greeting" method

In `friend.rb`, add the following inside the class (before the "end").

    def greeting
    end

Save it. Run the test again.

## Watch it fail

Now you should see an error like this:

    'Friend says hello' FAILED
    expected: "Hello!",
         got: nil (using ==)
    ./friend_spec.rb:5:

This means that there is a method, but it's not returning anything! ("nil" is the Ruby way of saying "not anything".)

## Make it return something

Inside the "greeting" method, put a single line containing a string that is *not* "Hello!". (Here we are simulating you making an honest mistake, so we can see what the error message looks like.)

    def greeting
      "whuh?"
    end

Save it. Run the test again.

## Watch it fail

Now you should see an error like this:

    'Friend says hello' FAILED
    expected: "Hello!",
         got: "whuh?" (using ==)
    ./friend_spec.rb:5:

Correct this by changing "whuh?" to "Hello!". Save it. Run the test again.

## Watch it pass!

Hooray! Finally! It works!

## Give yourself a high five

Also, sing a song and do a little dance.

## And then...

Fix the next failure! :-)

Hint 1: in order to get the next test to pass, you will need to pass a *parameter*:

    def greeting(who)

Hint 2: once you do that, the **first** test might start failing again. And that means you need to provide a **default value** for that parameter:

    def greeting(who = nil)


