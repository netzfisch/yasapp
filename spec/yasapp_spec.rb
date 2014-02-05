require 'spec_helper'

describe "YaSApp" do
  describe "GET show at '/'" do
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

  describe "POST create at '/reverse'" do
    # curl -X -d "reverse me" localhost:5000/reverse/Hello
    it "reverses posted value" do
      post '/reverse/Hello' #, params = {:str => 'Hello'}
      expect(last_response.body).to eq 'olleH'
    end
  end
end
