Gem::Specification.new do |s|
  s.name        = "capybara-celerity"
  s.version     = "0.0.2"
  s.authors     = ["Gabriel Sobrinho"]
  s.email       = ["gabriel.sobrinho@gmail.com"]
  s.homepage    = "https://github.com/sobrinho/capybara-celerity"
  s.summary     = %q{Capybara driver for celerity}
  s.description = %q{Capybara driver for celerity}

  s.files         = Dir.glob("lib/*") + %w( README.md Rakefile )
  s.test_files    = Dir.glob("spec/*")
  s.require_paths = ["lib"]
  
  s.add_dependency "capybara", "~> 1.1.0"
  s.add_dependency "celerity", "~> 0.8.9"

  s.add_development_dependency "rake", ">= 0.8.7"
  s.add_development_dependency "rspec", "~> 2.5"
  s.add_development_dependency "sinatra", "~> 1.0"
  
  s.has_rdoc = false
end
