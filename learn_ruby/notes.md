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

The `solutions` branch is dead; long live the `solution` directory. 

To add a solution, you must put your Ruby file(s) in a directory **inside** the current module directory with the name `solution`.

To test your solution, you must use `../sspec foo_spec.rb`. `sspec` is a custom version of `spec` that adds the solution subdirectory to the load path.

Make sure not to check in any cruft in the original module directory, since that will be seen by (and surely befuddle) students.

Multiple solutions aren't supported quite yet. Keep watching.

## Notes and instructions

Every module has (or can have) a `index.md` file that the students can read.

The HTML files are all generated from Markdown, so restrict your edits to the `.md` files.

## Tricks

Here are some nice git config settings:

    git config --global alias.st status
    git config --global alias.ci commit
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global push.default matching

