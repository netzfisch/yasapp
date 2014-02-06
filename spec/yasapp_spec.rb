require 'spec_helper'

describe "Yet annother Sinatra Application" do
  describe "GET show '/'" do
    it "allows home page access" do
      get '/'
      expect(last_response).to be_ok
    end

    it "sends http status code '200'" do
      get '/'
      expect(last_response.status).to eq 200
    end

    it "shows welcome message" do
      get '/'
      expect(last_response.body).to match 'Welcome to the Sinatra course at RubyLearning. Yeah, that\'s awesome!'
    end
  end

  describe "GET show '/haml-view'" do
    it "shows current time" do
      Time.stub(:now).and_return('2014-02-06 14:08:31')

      get '/haml-view'
      expect(last_response.body).to match '14:08'
    end
  end

  describe "POST create '/reverse'" do
    it "reverses posted value" do
      post '/reverse/Hello' #, params = {:str => 'Hello'}
      expect(last_response.body).to eq 'olleH'
    end
  end
end
