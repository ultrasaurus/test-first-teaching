# Advanced Setup

## Pulling changes

If you've been working for a while and then notice that the course repository has changed and you want the new stuff:

* View the "status" and make sure you have nothing modified

        git status

* Pull the changes

        git pull origin master

## Forking (not cloning)

To save a copy of your own solutions in your own github repo, you'll have to "fork" the course on Github. This will give you a new git url of your very own, which you can then clone as above. For instance, if your github name is `ladyhaha`, your clone command is

        git clone git://github.com/ladyhaha/learn_ruby.git

To pull changes into this new repo is a little tricky and you should probably ask for help before doing it, but here's the instructions.

* Add a reference to the original remote repository

        git remote add ultrasaurus git://github.com/ultrasaurus/learn_ruby

* Pull down the remote repository's master branch. This creates a local branch called `ultrasaurus/master`

        git pull origin master

* Now merge the `ultrasaurus/master` stuff into your `master` branch

        git merge ultrasaurus/master

* Finally push your own `master` branch back to your `origin` remote github repository.

        git push origin master

If you want to understand all these magical git incantations, watch this great screencast: <http://blip.tv/file/4094854> (more at <http://www.gitcasts.com>)

