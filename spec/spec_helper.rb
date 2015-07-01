require 'simplecov'
SimpleCov.start

require 'factory_girl'
require 'aruba'
require 'aruba/api'

include Aruba::Api

root = Pathname.new(__FILE__).parent.parent

ENV['PATH'] = "#{root.join('bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

RSpec.configure do |config|
  config.pattern = 'spec/**/*.rb'
  config.include FactoryGirl::Syntax::Methods
end
