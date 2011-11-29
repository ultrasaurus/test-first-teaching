# Teacher Notes

## Slides

Some slides are in test-first-teaching/ruby_notes. They're in Markdown+Showoff format, which means they should be usable either as slides

    cd ruby_notes
    showoff ruby_notes

or plain HTML

    cd ruby_notes
    rdiscount *.md > index.html

## Rules (for students)

* Always read the error!

## Solutions

The `solutions` branch is dead; long live the `solution` directory.

To add a solution, you must put your Ruby file(s) in a directory **inside** the lab directory with the name `solution`, e.g. `learn_ruby/hello/solution/hello.rb`.

Solutions only appear in the teacher repository (`test-first-teaching`) not the generated student repo (`learn_ruby`). When you run `rake` the tests will be run against the solutions, to assure that your code is correct.

Make sure not to check in any cruft in the lab directory, since that will be seen by (and surely befuddle) students.

Multiple solutions aren't supported yet.

## Notes and instructions

Every lab has (or can have) a `index.md` file that the students can read. This is a good place for background, instructions and hints for solving the exercises.

Files ending with `.md` (Markdown) are converted to HTML and given a `.html` suffix, and files ending with `.scss` (Sass/SCSS) are converted to CSS and given a `.css` suffix. Any other files will be copied over to the student repo as is.

Lab directories become numbered; e.g. `hello` will become `00_hello`.

Each curriculum contains an `assets` directory, which is a good place to put shared files like `.js` and `.css` and images. You can refer to them using `..` in your markdown files, e.g.

    ![logo](../assets/logo.gif)

This works in "preview mode" too, though it's a little weird, since `.scss` isn't converted into `.css` until the course is built using `rake build`.

There's also a `ubiquitous` directory, whose contents are copied into each and every generated lab directory.

## Tricks

Here are some nice git config settings:

    git config --global alias.st status
    git config --global alias.ci commit
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.unadd "reset HEAD"
    git config --global alias.l "log --oneline --decorate --graph"

    git config --global push.default matching

    git config --global color.branch=auto
    git config --global color.diff=auto
    git config --global color.interactive=auto
    git config --global color.status=auto

Or, you can edit `$HOME/.gitconfig` -- you should have sections like this:

    [color]
            branch = auto
            diff = auto
            interactive = auto
            status = auto
    [alias]
            st = status
            ci = commit
            co = checkout
            br = branch
            unadd = reset HEAD
            l = log --oneline --decorate --graph
    [push]
            default = matching


