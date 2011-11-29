This repo contains all the source code that generates the <http://testfirst.org> web site and courses. 

Courses comprise sets of labs; each course has its own github repo, which students clone (or fork and clone) and do their work inside the clone.

If you want to teach a class, or edit the exercises, then this project is for you. If you want to learn ruby, go check out <http://github.com/alexch/learn_ruby> instead.

## Quick Start

    git clone [this repo]
    cd test-first-teaching
    bundle install  # if "bundle install" fails, try "bundle update"
    rake            # runs all tests, including exercises with solutions

## Definitions

**curriculum** - a top-level category, usually specified by language or framework. E.g. `learn_ruby` or `learn_java` or `learn_rails`.

**lab** - a group of related test-first exercises inside a curriculum. E.g. `array` or `calculator` or `threads`. Labs can contain tests, descriptions, sample data, and solutions.

**course** - a list, in order, of a chosen group of labs that will be built into a *repo* that students can clone. Each course is defined by a **course file** which is in YAML format.

**course repo** - a git repository (probably on github) containing a built-out of a course's labs, but with some automatic processing. For instance, the repo does not contain solutions. Students should `git clone` this repo when taking a class. On the local file system, the repo must be located as a **sibling** of the test-first-teaching directory.

## How to teach a class

(todo: more detail)

1. choose or create a course file for your class inside the `courses` dir (e.g. ruby-for-artists.yaml)
2. create an appropriately named github repo and put its git url in the course file (e.g. `:repo: git@github.com:alexch/ruby-for-artists.git`)
3. run `rake build course=ruby-for-artists` and inspect the resulting repo (e.g. `../ruby-for-artists/`)
4. run `rake push course=ruby-for-artists` and watch for the course repo code to appear on github

See `courses/learn_ruby.yaml` for an example.

## How to write labs

Create or edit the spec files inside the lab directory and the solution files inside its `solution` subdirectory. Run `rake` and all labs will be tested; the `solution` dir will be added to the load path so you can easily separate exercises and data from solutions. If you want to run rake on just the lab you're in, like the students will, then `cd` into the lab dir and say `rake`.

TODO: easier way to to run only the foo lab's tests from the top level, e.g. `rake lab=foo`

To look at the generated course, run `rake build course=my_course` and then look inside `../my_course`. 

All files in the lab directory will be transferred into the built-out course's lab dir. Files ending with `.md` will be processed using Markdown and turned into `.html` files. Students will look for an `index.html` file with lab-specific hints and instructions.

There's a magic "lab" directory called "ubiquitous". Its contents will be copied into all the labs -- this is where we put the universal Rakefile so every lab gets its own Rakefile that's the same as all the others, so students can just run `rake` and get the fail-fast formatter.

TODO: allow subdirectories inside labs

## How to edit and publish the web site

All the web-only content is inside the `web` directory. We use [Erector](http://erector.rubyforge.org) to generate HTML, so to make a change, edit the `.rb` file. To see what the site will look like when deployed, run `rake run` which launches a local Sinatra app on <http://localhost:9292>.

<http://testfirst.org> is run on Heroku, and this repo is the Heroku app itself, so run `rake` then `git push heroku` to deploy.

Here's the first few lines from `heroku info`:

	=== testfirst
	Web URL:        http://testfirst.heroku.com/
	Domain name:    http://testfirst.org/
	Git Repo:       git@heroku.com:testfirst.git

If you want access to the Heroku app, ask <alex@stinky.com>.

# License

This material is all open-source. We understand that people may want to use these materials to teach classes, and may want to get paid for their work, so commercial use is permitted. All we ask is that you provide credit to this project and the original authors if you reproduce or promote your work.

All contents (included generated courseware) are Copyright (c) 2001-2011 by Alex Chaffee and the Test-First Teaching project, licensed under Creative Commons Attribution (CC BY 3.0) http://creativecommons.org/licenses/by/3.0/

 