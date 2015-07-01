# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teuliou/version'

Gem::Specification.new do |spec|
  spec.name          = 'teuliou'
  spec.version       = Teuliou::VERSION
  spec.authors       = ['Efflam Castel']
  spec.email         = ['efflamm.castel@gmail.com']
  spec.summary       = 'Create documents using templates'
  spec.description   = 'Create books and articles from markdown to pdf'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor', '~> 0.19'
  spec.add_runtime_dependency 'pandoc-ruby', '~> 1.0.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  spec.add_development_dependency 'rubocop', '~> 0.32'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'aruba', '~> 0.6'
  spec.add_development_dependency 'mockfs', '~> 0.1'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.1'
  spec.add_development_dependency 'factory_girl', '~> 4.5'
  spec.add_development_dependency 'guard-rspec', '~> 4.5'
  spec.add_development_dependency 'guard-rubocop', '~> 1.2'
  spec.add_development_dependency 'simplecov'
end
