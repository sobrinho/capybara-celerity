# Capybara Celerity Driver

A driver for Capybara using [Celerity](http://celerity.rubyforge.org).
It uses [HtmlUnit](http://htmlunit.sourceforge.net) a browser for Java programs.

**NOTE** that Celerity only works on JRuby, thus applies to this driver as well.

## Install

    jruby -S gem install capybara-celerity

## Setup

Setup the gem in Your `Gemfile`:

    gem 'capybara-celerity', :platforms => :jruby

Set the driver in Your `spec_helper.rb`/`test_helper.rb`:

    Capybara.javascript_driver = :celerity

or even better set the driver only for JRuby :

    Capybara.javascript_driver = :celerity if defined?(JRUBY_VERSION)
