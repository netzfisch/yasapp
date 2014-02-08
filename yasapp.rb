require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require 'slim'

# Because of testability you can't use sinatra's anonymous shorthand
# helpers (helpers do), which are hard to reference because of the
# anonymous character. The solution is to make a explicit module and
# propagate it to the application.
module AppHelpers
  def backwards(string)
    string.reverse
  end

  def human_date(datetime)
    datetime.strftime('%-d. %B %Y, %H:%M Uhr')
  end
end
Sinatra::Application.helpers AppHelpers

before do
  @current_date = human_date(Time.now)
end

get '/' do
  haml :index
end

get '/pass' do
  if params[:password] == 'doe'
    slim :pass
  else
    "Sorry, NOT PASSING - wrong password, we logged your IP #{params[:ip]} !"
  end
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
