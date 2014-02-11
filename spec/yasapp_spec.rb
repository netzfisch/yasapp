require 'spec_helper'

describe "Yet annother Sinatra Application" do
# describe "Before Filter", focus: true do
#   it "assings @current_date" do
#     get '/'
#     expect(assign :current_date).not_to be nil
#   end
# end

  describe "GET show '/'" do
    it "allows page access" do
      get '/'
      expect(last_response).to be_ok
    end

    it "sends status code '200'" do
      get '/'
      expect(last_response.status).to eq 200
    end

    it "shows welcome message" do
      get '/'
      expect(last_response.body).to match 'Welcome to "Yet'
    end

    it "formats current date time" do
      Time.stub(:now).and_return(Time.new 2014,02,06,14,18,33)

      get '/'
      expect(last_response.body).to match '14:18'
    end
  end

  describe "GET show '/pass'" do
    it "allows access" do
      get '/pass', params = { password: 'doe' }
      expect(last_response.body).to match 'Got your submitted data:'
    end

    it "denies access" do
      get '/pass', { password: 'wrong-one' }
      expect(last_response.body).to match 'Sorry, NOT PASSING'
    end
  end

  describe "POST create '/reverse'" do
    it "reverses value from html form" do
      post '/reverse', { str: 'Hello' }
      expect(last_response.body).to match 'olleH'
    end

    it "reverses value from http request" do
      post '/reverse/Hello'
      expect(last_response.body).to eq 'olleH'
    end
  end

  describe "POST create '/quote'" do
    it "allows page access" do
      post '/quote', { symbol: 'goog' }
      expect(last_response).to be_ok
    end

#   it "renders the 'quote' template" do
#     post '/quote', { symbol: 'goog' }
#     expect(last_response).to render_template 'quote'
#   end

#   it "assigns the requested stock as @symbol" do
#     post '/quote', { symbol: 'goog' }
#     expect(assigns :symbol).not_to be nil
#   end

    it "shows stock name" do
      post '/quote', { symbol: 'goog' }
      expect(last_response.body).to match 'GOOG'
    end

    it "shows stock price" do
      post '/quote', { symbol: 'GOOG' }
      expect(last_response.body).to match 'USD'
    end
  end

  describe "POST create '/participants'" do
    pending
  end

  describe "GET show '/participants/:id'" do
    pending
  end
end
