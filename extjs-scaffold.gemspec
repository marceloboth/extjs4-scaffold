# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "extjs-scaffold/version"

Gem::Specification.new do |s|
  s.name        = "extjs-scaffold"
  s.version     = Extjs4Scaffold::VERSION
  s.authors     = ["marcelo.both"]
  s.email       = ["marcelo.both@gmail.com"]
  s.homepage    = "https://github.com/marceloboth/extjs4-scaffold"
  s.summary     = "Scaffold Generator for Rails 4 and Extjs 4"
  s.description = "Scaffold Generator for Rails 4 and Sencha Extjs 4"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec", "~> 2.7.0"
  s.add_development_dependency "rspec-rails", "~> 2.7.0"
  s.add_development_dependency "generator_spec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "aruba", "< 0.4.7"
  s.add_runtime_dependency "rails", "~> 4.0.0"
  #s.add_runtime_dependency "extjs4-rails"
end
