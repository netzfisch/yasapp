require File.expand_path '../../yasapp.rb', __FILE__
require 'rack/test'
require 'rspec'

set :environment, :test

module RSpecMixin
  include Rack::Test::Methods

  def
    app() Sinatra::Application
  end
end

RSpec.configure { |c| c.include RSpecMixin }
