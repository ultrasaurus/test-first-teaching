## Open a terminal in this directory

    cd hello

This directory is the starting point for this exercise. It contains a spec file and you'll be adding a ruby file to (eventually) make the specs pass.

## Run the spec

    spec hello_spec.rb
        
## Watch it fail

You should see an error. Don't just ignore it! Try to read it and figure out what it's telling you. Somewhere on the first line it should say something like

    no such file to load -- test-first-teaching/hello/hello (LoadError)
    
That means that it is looking for a file called "hello.rb" and can't find it.

## Create hello.rb

Open up hello.rb in a text editor. Save it. Run the spec again.

    spec hello_spec.rb
        
## Watch it fail

Now you should see an error like this:

    ./hello_spec.rb:3: uninitialized constant Hello (NameError)

## Create the Hello class

Fix this by opening hello.rb and creating an empty class:

    class Hello
    end
    
Save it. Run the spec again.
  
## Watch it fail

Now you should see an error like this:

    $ spec hello_spec.rb 
    F

    1)
    NoMethodError in 'Hello says hello'
    undefined method `message' for #<Hello:0x1180f3c>
    ./hello_spec.rb:5:

    Finished in 0.002132 seconds

    1 example, 1 failure

This means that while it found the file, and it found the class, it couldn't find the method named "message".

## Define the "message" method

In hello.rb, add the following inside the class (before the "end").

    def message
    end

Save it. Run the spec again.

## Watch it fail

Now you should see an error like this:

    'Hello says hello' FAILED
    expected: "hello",
         got: nil (using ==)
    ./hello_spec.rb:5:
    
This means that there is a method, but it's not returning anything! ("nil" is the Ruby way of saying "not anything".)

## Make it return something

Inside the "message" method, put a single line containing a string that is *not* "hello". (Here we are simulating you making an honest mistake, so we can see what the error message looks like.)

    def message
      "whuh?"
    end

Save it. Run the spec again.

## Watch it fail

Now you should see an error like this:

    'Hello says hello' FAILED
    expected: "hello",
         got: "whuh?" (using ==)
    ./hello_spec.rb:5:

Correct this by changing "whuh?" to "hello". Save it. Run the spec again.

## Watch it pass!

Hooray! Finally! It works!

## Give yourself a high five

Also, sing a song and do a little dance.

