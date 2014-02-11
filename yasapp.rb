require 'sinatra'
require 'sinatra/reloader' if development?
require './helpers'
require './lib/stock'
require './models/participant'
require 'haml'
require 'slim'

before { @current_date = human_date(Time.now) }

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
  haml :reverse
end

# will not work in browser, needs to be triggered via
# $ curl -X -d "reverse me" localhost:5000/reverse/Hello
post '/reverse/:str' do
  backwards params[:str]
end

post '/quote' do
  @stock = Stock.new params[:symbol]
  slim :quote
end

# save participant's details
post '/participants' do
  begin
    @participant = Participant.new(name: params[:name], email: params[:email])
    @participant.save
    redirect "/participants/#{@participant.id}"
  rescue
    redirect '/'
  end
end

# display participant's details
get '/participants/:id' do
  begin
    @participant = Participant.find(params[:id])
    @participants = Participant.find(:all)
    slim :participant
  rescue
    redirect '/'
  end
end
