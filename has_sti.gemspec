$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "has_sti/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "has_sti"
  s.version     = HasSti::VERSION
  s.authors     = ["Arkadiusz Fal"]
  s.email       = ["me@arekf.net"]
  s.homepage    = "http://arekf.net"
  s.summary     = "Active Record extension that provides helper methods for Single Table Inheritance models"
  s.description = "has_sti provides helper methods for Single Table Inheritance models of Active Record. " \
                  "It creates methods that allow to determine exact type of model and scopes that make easy " \
                  "to find records of certain type."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.required_ruby_version = ">= 2.0.0"

  s.add_dependency "activerecord", ">= 4.0.0"

  s.add_development_dependency "rails", "~> 4.2.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "codeclimate-test-reporter"
end
