require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'

set :display_string, 'Welcome to the Sinatra course at RubyLearning.'

def reverse string
  string.each_char.to_a.reverse
end

before do
  @msg = 'Yeah, that\'s awesome!'
end

get '/' do
  settings.display_string + " " + @msg
end

get '/haml-view' do
  haml :index
end

# will not work in browser, need to be triggered via
# curl -X -d "reverse me" localhost:5000/reverse/Hello
post '/reverse/:str' do
  reverse params[:str]
end
