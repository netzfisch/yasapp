require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'

#helpers do
  def backwards(string)
    string.reverse
  end

  def human_date(datetime)
    datetime.strftime('%-d. %B %Y, %H:%M Uhr')
  end
#end

before do
  @current_date = human_date(Time.now)
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
