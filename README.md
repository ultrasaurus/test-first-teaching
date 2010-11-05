This repo contains all the source code that generates the <http://testfirst.org> web site and courses. 

Courses comprise sets of chapters; each course has its own github repo, which students clone (or fork and clone) and do their work inside the clone.

If you want to teach a class, this project is for you. If you want to learn ruby, go check out <http://github.com/alexch/learn_ruby> instead.

## Definitions

**curriculum** - a top-level category, usually specified by language or framework. E.g. `learn_ruby` or `learn_java` or `learn_rails`.

**chapter** - a group of related test-first exercises inside a curriculum. E.g. `array` or `calculator` or `threads`. chapters can contain tests, descriptions, sample data, and solutions.

**course** - a list, in order, of a chosen group of chapters that will be built into a *repo* that students can clone. Each course is defined by a **course file** which is in YAML format.

**course repo** - a git repository (probably on github) containing a built-out of a course's chapters, but with some automatic processing. For instance, the repo does not contain solutions. Students should `git clone` this repo when taking a class. On the local file system, the repo must be located as a **sibling** of the test-first-teaching directory.

## How to teach a class

(todo: more detail)

1. choose or create a course file for your class inside the `courses` dir (e.g. ruby-for-artists.yaml)
2. run `rake course:build course=ruby-for-artists` and inspect the resulting repo (e.g. `../ruby-for-artists/`)
3. run `rake course:push course=ruby-for-artists` and watch for the course repo code to appear on github

See `courses/learn_ruby.yaml` for an example.

## How to write chapters

(todo: more detail)

Create or edit the spec files inside the chapter directory and the solution files inside its `solution` subdirectory. Run `rake` and all chapters will be tested. (todo: run `rake chapter=foo` to run only the foo chapter's tests)

## How to edit and publish the web site

All the web-only content is inside the `web` directory. We use [Erector](http://erector.rubyforge.org) to generate static HTML, so to make a change, edit the `.rb` file, **not** the `.html` files (since they'll get clobbered).

<testfirst.org> is run on Heroku, and this repo is the Heroku app itself, so run `rake` then `git push heroku` to deploy.

Here's the first few lines from `heroku info`:

	=== testfirst
	Web URL:        http://testfirst.heroku.com/
	Domain name:    http://testfirst.org/
	Git Repo:       git@heroku.com:testfirst.git

