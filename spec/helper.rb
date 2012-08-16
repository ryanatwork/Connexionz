$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start
end
require 'connexionz'
require 'rspec'
require 'webmock/rspec'

def fixture_path
    File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
    File.new(fixture_path + '/' + file)
end
