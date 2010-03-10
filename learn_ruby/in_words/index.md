# Extending a built-in class

To make this test pass you'll need to extend a built-in class. You'll see that we're creating a new spec for 'Fixnum' -- this isn't a new class you;ll be building, but instead it is a built-in class you will extend.

Remember that in Ruby, everything is an object, even a number.  Try this in irb

    >> 4.class
    => Fixnum
    >> 4.methods
    \["inspect", "%", "<<", ...

The number 4 is of class FixNum and it has methods on it.  Your challenge is to add an in_words method.

## Run the spec
   
    spec in_words_spec.rb

## Watch it fail

   just as with hello, you'll see an error which you can read to know what file to create

## Run the spec, Watch it fail
   
    spec in_words_spec.rb

now you should see a number of errors like this:

    1)
    NoMethodError in 'Fixnum reads 0 to 9'
    undefined method `in_words' for 0:Fixnum
    ./in_words_spec.rb:8:

You extend a class just like you would add a new class:

    class Fixnum
        def in_words
            self.to_s
        end
    end

## Make the tests pass one at a time

Write the code to make only the first test pass.  Once it passes, go back and look at your code to see if you can refactor it to make it clearer or cleaner. Then run the spec again.

