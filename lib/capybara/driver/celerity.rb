class Capybara::Driver::Celerity < Capybara::Driver::Base
  require "capybara/driver/celerity/node"

  attr_reader :app, :rack_server, :options

  def initialize(app, options={})
    @app = app
    @options = options
    @rack_server = Capybara::Server.new(@app)
    @rack_server.boot if Capybara.run_server
  end

  def visit(path)
    browser.goto(url(path))
  end

  def current_url
    browser.url
  end

  def source
    browser.html
  end

  def body
    browser.document.as_xml
  end

  def response_headers
    browser.response_headers
  end

  def status_code
    browser.status_code
  end

  def find(selector)
    browser.elements_by_xpath(selector).map { |node| ::Capybara::Driver::Celerity::Node.new(self, node) }
  end

  def wait?
    true
  end

  def execute_script(script)
    browser.execute_script script
    nil
  end

  def evaluate_script(script)
    browser.execute_script "#{script}"
  end

  def browser
    unless @_browser
      require 'celerity'
      @_browser = ::Celerity::Browser.new(options)
    end

    @_browser
  end

  def reset!
    browser.clear_cookies
  end

private

  def url(path)
    rack_server.url(path)
  end
end
