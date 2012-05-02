require 'rubygems'
require 'rspec'
require 'yaml'
require 'simplecov'

include RSpec::Mocks::ExampleMethods

SimpleCov.start

require File.expand_path('../../lib/bubble', __FILE__)

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = :documentation
end