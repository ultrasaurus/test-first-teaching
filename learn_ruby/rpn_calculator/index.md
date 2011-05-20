RPN Calculator

"RPN" stands for "Reverse Polish Notation". (See [the wikipedia entry](http://en.wikipedia.org/wiki/Reverse_Polish_notation) for more information on this colorful term.) Briefly, in an RPN world, instead of using normal "infix" notation, e.g.

    2 + 2

you use "postfix" notation, e.g.

    2 2 +

While this may seem bizarre, there are some advantages to doing things this way. For one, you never need to use parentheses, since there is never any ambiguity as to what order to perform operations in. The rule is, you always go from the back, or the left side.

    1 + 2 * 3 =>
    (1 + 2) * 3 or
    1 + (2 * 3)

    1 2 + 3 * => (1 + 2) * 3
    1 2 3 * + => 1 + (2 * 3)

Another advantage is that you can represent any mathematical formula using a simple and elegant data structure, called a [stack](http://en.wikipedia.org/wiki/Stack_(data_structure)).

# Hints

Ruby doesn't have a built-in stack, but the standard Array has all the methods you need to emulate one (namely, `push` and `pop`, and optionally `size`).

