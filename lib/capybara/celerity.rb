require 'capybara'
require 'capybara/celerity/driver'
require 'capybara/celerity/version'

Capybara.register_driver :celerity do |app|
  Capybara::Celerity::Driver.new(app)
end
