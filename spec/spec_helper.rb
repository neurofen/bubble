require 'rubygems'
require 'rspec'
require 'yaml'
require 'simplecov'

include RSpec::Mocks::ExampleMethods

SimpleCov.start

require File.expand_path('../../lib/bubble', __FILE__)

RSpec.configure do |config|
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_framework = :mocha
  #config.mock_framework = :flexmock
  # config.mock_framework = :rr
  config.color_enabled = true
  config.formatter = :documentation
end