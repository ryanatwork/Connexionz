# -*- encoding: utf-8 -*-
require File.expand_path('../lib/connexionz/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'connexionz'
  gem.version     = Connexionz::VERSION
  gem.author      = "Ryan Resella"
  gem.email       = 'ryan@codeforamerica.org'
  gem.homepage    = 'https://github.com/ryanatwork/connexionz/'
  gem.summary     = gem.description
  gem.description = %q{A Ruby wrapper for the Connexionz bus api}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.require_paths = ['lib']

  gem.add_development_dependency 'maruku'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'webmock'

  gem.add_runtime_dependency 'faraday', '~> 0.8.4'
  gem.add_runtime_dependency 'faraday_middleware', '~> 0.9.0'
  gem.add_runtime_dependency 'hashie', '~> 1.2.0'
  gem.add_runtime_dependency 'multi_xml', '~> 0.5.3'
  gem.add_runtime_dependency 'patron', '~> 0.4.17'
  gem.add_runtime_dependency 'rash', '~> 0.3.0'
end
