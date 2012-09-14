$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pixelator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pixelator"
  s.version     = Pixelator::VERSION
  s.authors     = ["HowAboutWe.com, Rebecca Miller-Webster, Marco Carag, Brendan Barr"]
  s.email       = ["dev@howaboutwe.com"]
  s.homepage    = "http://wwww.github.com/howaboutwe/pixelator"
  s.summary     = "Add tracking pixels to your code in a manageable, performant way"
  s.description = "TODO: Description of Pixelator."
  s.licenses = ["MIT"]

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "haml"
  s.add_dependency "railties", "~> 3.1"
  s.add_dependency "jquery-rails"
  s.add_dependency "uglifier"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "jasmine"
end
