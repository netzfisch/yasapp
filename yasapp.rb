require 'sinatra'
require 'sinatra/reloader' if development?

set :display_string, 'Welcome to the Sinatra course at RubyLearning.'

before do
  @msg = 'Yeah, that\'s awesome!'
end

get '/' do
  settings.display_string + " " + @msg
end
