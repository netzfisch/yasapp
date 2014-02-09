require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require 'slim'
require 'open-uri'
require 'csv'

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

class Stock
  def initialize(symbol)
    @symbol = symbol.upcase
    get_info
  end

  attr_reader :row0, :row1, :row2, :row3, :row4, :row5, :row6, :row7

  private
  def get_info #Get info about specific stock
    url = "http://download.finance.yahoo.com/d/quotes.csv?s=#{@symbol}&f=sl1d1t1c1ohgv&e=.csv"
    csv = CSV.parse(open(url).read)
    csv.each do |row| #parse csv data
      @row0 = row[0]
      @row1 = row[1]
      @row2 = row[2]
      @row3 = row[3]
      @row4 = row[4]
      @row5 = row[5]
      @row6 = row[6]
      @row7 = row[7]
    end
  end
end

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
