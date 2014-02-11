source "https://rubygems.org"
ruby '1.9.3'

gem 'sinatra'
gem 'sinatra-activerecord'
gem 'haml'
gem 'slim'

group :development, :test do
  gem 'sinatra-contrib'     # provides sinatra/reloader
  gem 'sqlite3'             # provides database connection
end

group :test do
  gem 'rspec'
  gem 'autotest-standalone' # provides autotest
  gem 'autotest-inotify'    # monitors file alterations
  gem 'autotest-growl'      # shows visual notifications
end

group :production do
  gem 'pg'                  # provides database connection
end
