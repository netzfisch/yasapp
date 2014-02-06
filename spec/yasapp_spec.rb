require 'spec_helper'

describe "Yet annother Sinatra Application" do
  describe "helpers" do
#   subject do
#     Class.new { include YasappHelpers }
#   end

    describe "#backwards" do
      it "reverses given string" do
        expect(backwards 'Hello').to eq 'olleH'
      end
    end

    describe "#human" do
      it "formats date and time readable" do
        t = Time.new(2014,02,06,14,18,33)

        expect(human_date t).to eq '6. February 2014, 14:18 Uhr'
      end
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
      Time.stub(:now).and_return(Time.new 2014,02,06,14,18,33)

      get '/'
      expect(last_response.body).to match '14:18'
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
