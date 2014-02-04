require 'spec_helper'

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
