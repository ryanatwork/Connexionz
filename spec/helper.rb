$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start
require 'connexionz'
require 'rspec'
require 'webmock/rspec'

def a_delete(path)
  a_request(:delete, 'http://businfo.santa-clarita.com/' + path)
end

def a_get(path)
  a_request(:get, 'http://businfo.santa-clarita.com/' + path)
end

def a_post(path)
  a_request(:post, 'http://businfo.santa-clarita.com/' + path)
end

def a_put(path)
  a_request(:put, 'http://businfo.santa-clarita.com/' + path)
end

def stub_delete(path)
  stub_request(:delete, 'http://businfo.santa-clarita.com/' + path)
end

def stub_get(path)
  stub_request(:get, 'http://businfo.santa-clarita.com/' + path)
end

def stub_post(path)
  stub_request(:post, 'http://businfo.santa-clarita.com/' + path)
end

def stub_put(path)
  stub_request(:put, 'http://businfo.santa-clarita.com/' + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end