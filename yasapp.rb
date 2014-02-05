require 'sinatra'
require 'sinatra/reloader' if development?

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

post '/reverse/:str' do
  reverse params[:str]
end
