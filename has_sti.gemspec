$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "has_sti/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "has_sti"
  s.version     = HasSti::VERSION
  s.authors     = ["Arkadiusz Fal"]
  s.email       = ["arek@arekf.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of HasSti."
  s.description = "TODO: Description of HasSti."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
