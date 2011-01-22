# Say Hello to JavaScript

## Open a console

Once the console is open, change directories into the 00_hello directory

    cd 00_hello

## Run the Jasmine server

    rake jasmine
    
## Open the spec page in your web browser

    open http://localhost:8888/  # Mac only
    
You should see a failing spec. This is good! Now it's your turn to make it pass.

## Open the spec file in a text editor

    open HelloSpec.js  # Mac only
    
This file is written in a particular syntax for a testing tool named Jasmine BDD. Here are a few important rules:

1. each "`describe`" starts a related group of specs
2. each "`it`" starts a single spec
3. each "`expect`" describes a single **assertion** about your source code

For example, `expect(hello()).toEqual("Hello!")` means "when I call the function `hello()`, I expect its result to be equal to the string `"Hello!"`"

## Create the source file

Create and open a file named `hello.js`. Inside it, put the following text:

    function hello() {
    }
    
## Reload the spec page in the browser

You should still see the same failing spec, but it should be failing for a different reason.

## Make the first spec pass

Make `hello.js` look like this:

    function hello() {
        return "Hello!"
    }

Reload the spec page in the browser. The first spec should pass! 

## Now do a little victory dance!

Also, high five your partner. If you don't have a partner, high five your dog.

## Next steps

Make the next spec pass. This will require an `if` statement and some messing around with the function declaration. 

Here's a hint: In JavaScript, if the caller forgets to pass in an argument to a function, then its value is *undefined* (which is almost the same thing as *false*).
