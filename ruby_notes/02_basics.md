## Chapter 2. Objects, methods, and local variables

<!SLIDE incremental>

# What is an object?

An object encapsulates state and behavior.

*encapsulate* - put like things together; keep unlike things apart

*state* - data, variables, properties, attributes, constants

*behavior* - methods

# Objects vs. classes

* objects are more fundamental than classes
* in Ruby, you can add behavior to an object directly
* class inheritance is complicated; we'll cover that later

<!-- * Section 2.1. Talking to objects -->

# Creating an object

    @@@ ruby
    thing = Object.new

* now `thing` refers to an object *instance*
  * unique storage location in memory
  * *instance variables* stored in that location

# Defining behavior

    @@@ ruby
    def thing.talk
      puts "I'm a thing."
    end

!SLIDE

![method definition](method_definition.png)
(screengrabbed from _The Well-Grounded Rubyist_ PDF)

# Sending messages

    @@@ ruby
    thing.talk

prints `I'm a thing.` to the console

  * the object `thing` receives the message `talk` and executes the method `talk`
  * dot (`.`) is the *message operator*

# Expression values

In Ruby, every expression evaluates to some value

    @@@ ruby
    >> 2 + 2
    => 4
    >> (2+2).zero?
    => false
    >> "zero" if (2+2).zero?
    => nil

# Parameters and return values

    @@@ ruby
    def thing.to_fahrenheit(celcius)
      celcius * 9.0 / 5 + 32
    end

* `celcius` is a parameter
* the value of a function is the value of the final statement
  * in this case, the only statement
* the keyword `return` is available, but usually unnecessary

# Arguments vs. Parameters

* technically speaking, *arguments* are passed and *parameters* are declared

    @@@ ruby
    def thing.to_fahrenheit(celcius)
      celcius * 9.0 / 5 + 32
    end
    boiling = 100
    thing.to_fahrenheit(boiling)

* In this code, `boiling` is an argument and `celcius` is a parameter
* In practice, the two terms are interchangeable

# Getter and setter methods

    @@@ ruby
    def thing.age=(years_old)
      @age = years_old
    end
    def thing.age
      @age
    end

    thing.age = 17
    thing.age #=> 17
    thing.@age #=> SyntaxError

# The setter gotcha

* Syntax ambiguity! Oh noes!
* Inside an object, you can't call that object's setter methods directly
* Why not? Because "`age = 2`" looks like a *local variable* action, which takes preference
* Solution: use "`self.age = 2`"

# Boolean methods

    @@@ ruby
    def thing.child?
      @age < 18
    end

    thing.age = 16
    thing.child? #=> false

# Bang methods

    @@@ ruby
    def thing.birthday!
      @age = @age + 1
    end

* "`!`" is pronounced "bang"
* usually means "watch out" or "destructive" or "side effect"
  * could also mean "may raise an exception"
  * no real rule, so watch out

<!-- Section 2.3. The innate behaviors of an object -->
# The `methods` method

    @@@ ruby
    >> thing.methods
    => [:age=, :age, :to_fahrenheit, :child?, :nil?, ...]
    >> thing.methods(false)
    => [:age=, :age, :to_fahrenheit, :child?]

also useful: `thing.methods.sort`, `thing.methods.grep(/age/)`

# Sending a message by name

    @@@ ruby
    >> thing.age
    => 16
    >> thing.send(:age)
    => 16
    >> property = "age"
    => "age"
    >> thing.send(property)
    => 16


# Object equality

* Many ways to compare objects
  * `==` params are equal (overridable)
  * `.eql?` params are equal *and* the same type
  * `.equal?` params are identical (same `object_id`)

# Splat arguments

    @@@ ruby
    def thing.greet(greeting, *names)
      names.each do |name|
        puts "#{greeting}, #{name}!"
      end
    end

    >> thing.greet("Hello", "Alice", "Bob", "Charlie")
    Hello, Alice!
    Hello, Bob!
    Hello, Charlie!

# Default values

    @@@ ruby
    def thing.eat(food = "chicken")
      puts "Yum, #{food}!"
    end

    >> thing.eat
    Yum, chicken!

    >> thing.eat "arugula"
    Yum, arugula!

# References and side effects

* a variable is a *reference* to an *instance* (persistent location in memory)
* if you have several references to the same instance, odd things can happen

        @@@ ruby
        friend = "Alice"
        teacher = friend
        friend.upcase!
        teacher
        => "ALICE"

# Duping and freezing and cloning

* `dup` makes a copy of the object's data, so you can change it without affecting the original
* `freeze` makes it so when you try to modify an object, it raises an exception instead
* `clone` is like `dup`, but cloning a frozen object freezes the new clone too

