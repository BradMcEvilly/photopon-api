ENV["RACK_ENV"] ||= "development"

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

config_file 'photopon_settings.yml'

autoload = %w(lib models actions)
autoload.each do |directory|
  Dir["./#{directory}/**/*.rb"].each { |file| require file }
end
