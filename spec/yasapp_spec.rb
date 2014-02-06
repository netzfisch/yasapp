require 'spec_helper'

describe "Yet annother Sinatra Application" do
  describe "#backwards" do
    it "reverses given string" do
      a = 'Hello'
      expect( backwards 'Hello' ).to eq 'olleH'
    end
  end

  describe "GET show '/'" do
    it "allows home page access" do
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

    it "shows current time" do
      Time.stub(:now).and_return('2014-02-06 14:08:31')

      get '/'
      expect(last_response.body).to match '14:08'
    end
  end

  describe "POST create '/reverse'" do
    it "reverses value from html form" do
      post '/reverse', params = {:str => 'Hello'}
      expect(last_response.body).to match 'olleH'
    end

    it "reverses value from http request" do
      post '/reverse/Hello'
      expect(last_response.body).to eq 'olleH'
    end
  end
end
