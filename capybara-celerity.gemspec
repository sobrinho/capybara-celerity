# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capybara/driver/celerity_version"

Gem::Specification.new do |s|
  s.name        = "capybara-celerity"
  s.version     = Capybara::Driver::CelerityVersion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gabriel Sobrinho"]
  s.email       = ["gabriel.sobrinho@gmail.com"]
  s.homepage    = "https://github.com/sobrinho/capybara-celerity"
  s.summary     = %q{Capybara driver for celerity}
  s.description = %q{Capybara driver for celerity}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "capybara", ">= 1.0.0.beta1"
  s.add_dependency "celerity", ">= 0.7.9"

  s.add_development_dependency "rake", ">= 0.8.7"
  s.add_development_dependency "rspec", "~> 2.5"
  s.add_development_dependency "sinatra", "~> 1.0"
end
