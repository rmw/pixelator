$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pixelator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pixelator"
  s.version     = Pixelator::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Pixelator."
  s.description = "TODO: Description of Pixelator."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
