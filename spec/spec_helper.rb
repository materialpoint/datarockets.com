unless ENV['COVERAGE'].nil?
  require 'simplecov'
  SimpleCov.start :rails
end

RSpec.configure do |config|
end
