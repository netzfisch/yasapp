require 'spec_helper'
require 'stock'

describe "App::Stock" do
  describe "#initialize" do
    it "raises error with no parameter passed" do
      expect{ Stock.new }.to raise_error
    end

    it "converts symbol upcase" do
      pending
#     Stock.initialize(symbol: 'goog')
#     expect(:symbol).to eq 'GOOG'
    end
  end

  describe "#get_info" do
    let(:quote) { Stock.stub!(:new).and_return(mock(Stock)) }

    describe "returns an array" do
      pending
# look for some examples e.g. at
# http://robots.thoughtbot.com/how-to-stub-external-services-in-tests
# http://robots.thoughtbot.com/how-to-test-sinatra-based-web-services
# https://github.com/nas/yahoo_stock/blob/master/spec/yahoo_stock/quote_spec.rb
    end
  end
end
