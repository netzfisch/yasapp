require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'

  def backwards string
    string.reverse
  end

before do
  @current_date = Time.now.to_s
end

get '/' do
  haml :index
end

post '/reverse' do
  @reverse_value = backwards params[:str]
  haml :show
end

# will not work in browser, needs to be triggered via
# $ curl -X -d "reverse me" localhost:5000/reverse/Hello
post '/reverse/:str' do
  backwards params[:str]
end
