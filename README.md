YaSApp
======

**YaSApp - Yet annother Sinatra Application** I built during the [Sinatra
Course][1] - 12th batch at [RubyLearning][2].

## Features

Use YaSApp as your **Sinatra Template Application** with following basic
implementations:

#### Basics

* routes
* before filter
* set method, to assign variables

#### ToDo's (not implemented yet)

* Mapping of URLs with parameters to functions
* Views with layouts, e.g. responsive - based on thoughtbot/neat
* Authentication
* DB mapping

Just cut not used functionality out and/or extend according to your needs.

# Developemnt

Install [heroku toolbelt][8], do `$ foreman start` and go to [loaclhost:5000][9].

# Testing

YaSApp uses [RSpec][4] and [autotest][5] (the standalone version of ZenTest) for continous test feedback. For single test runs just do `$ rspec` of for continous feedback `$ autotest`.

Make sure to install OS specific helper libaries, e.g. for linux do:

    $ sudo apt-get install libnotify-bin

Further hints are available via [autotest-inotify][6] (hard disk and CPU friendly file alteration monitoring) and [autotest-growl][7] (visual feedback of test results).

# Production

Clone, bundle install, commit and push to heroku:

    $ git clone git@github.com:netzfisch/yasapp.git
    $ bundle install 
    $ git init 
    $ git add . 
    $ git commit -m “commit Sinatra Template App” 
    $ heroku create sinatra-template-app
    $ git push heroku master 

Momentarily live deployed at heroku under [YaSApp][3].

[1]: http://rubylearning.com/blog/2013/12/28/a-free-online-course-on-sinatra-12th-batch/
[2]: http://rubylearning.com/
[3]: http://yasapp.herokuapp.com/
[4]: https://relishapp.com/rspec
[5]: https://github.com/grosser/autotest
[6]: https://github.com/ewollesen/autotest-inotify
[7]: https://github.com/svoop/autotest-growl
[8]: https://toolbelt.heroku.com/
[9]: http://localhost:5000/
