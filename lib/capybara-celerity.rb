require 'capybara'
require 'capybara/driver/celerity'

Capybara.register_driver :celerity do |app|
  Capybara::Driver::Celerity.new(app)
end
