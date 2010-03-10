# Teacher Notes

## key ruby concepts
* objects
  * methods (functions)
  * Everything has a value
* arithmetic operations
* string
* array
* hash
* symbols
* loops & iterators
* modules
* blocks, Proc
* regexps
* dynamic method definition
  * on classes
  * on instances
  * method_missing
* exceptions
  * rescue
  * ensure

## key rails concepts
* Exceptions and reading the logs
* MVC
* REST
* Migrations
* Routes
* Environments
* Scaffolding
* Generators
* ActiveRecord
  * Base WTF
  * find method
  * Associations
  * what's the SQL?
* Plugins
 * will_paginate

## Rules
* Always read the error!

## Solutions

I've created the "solutions" branch. In order to add a solution, you
must do the following in this exact order:

1. make sure the "master" branch does not have the solution in it --
either `git rm xxx.rb; git commit` or go edit the file to have no
content and `git add xxx.rb; git commit`.

2. switch to the solutions branch -- `git co solutions`

3. merge the master branch into the solutions branch -- `git merge master` -- note that this has to happen *after* you've committed the delete (step 1) or you'll end up merging the delete later which will remove your solution.

4. save the solution (text editor or `cat > xxx.rb` & paste)

5. add it to the branch -- `git add xxx.rb; git commit`

6. switch back to master -- `git co master`

7. push both branches to github -- `git push` (or, if you're configured oddly, `git push origin master solutions`)

Note: `git co` is an alias for `git checkout`. Here are some nice git config settings:

    git config --global alias.st status
    git config --global alias.ci commit
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global push.default matching

