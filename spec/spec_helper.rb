require 'SimpleCov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'
require File.expand_path(File.dirname(__FILE__) + '/../config/boot')
require 'factories.rb'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include FactoryGirl::Syntax::Methods
end
