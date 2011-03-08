require 'spec_helper'
require 'capybara/spec/driver'

describe Capybara::Driver::Celerity do
  before(:all) do
    @driver = Capybara::Driver::Celerity.new(TestApp)
  end

  it_should_behave_like "driver"
  it_should_behave_like "driver with javascript support"
  it_should_behave_like "driver with header support"
  it_should_behave_like "driver with status code support"
  it_should_behave_like "driver with cookies support"
end
