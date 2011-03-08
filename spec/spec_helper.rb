require 'rubygems'
require 'bundler/setup'
require 'capybara/celerity'

alias :running :lambda

Capybara.default_wait_time = 0

RSpec.configure do |config|
  config.before do
    Capybara.configure do |config|
      config.default_selector = :xpath
    end
  end
end
