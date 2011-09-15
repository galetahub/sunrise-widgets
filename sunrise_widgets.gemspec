# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunrise/widgets/version"

Gem::Specification.new do |s|
  s.name = "sunrise-widgets"
  s.version = Sunrise::Widgets::VERSION.dup
  s.platform = Gem::Platform::RUBY 
  s.summary = "Widgets plugin for sunrise-cms"
  s.description = "Widgets plugin for Sunrise CMS via aimbulance"
  s.authors = ["Igor Galeta", "Pavel Galeta"]
  s.email = "galeta.igor@gmail.com"
  s.rubyforge_project = "sunrise-widgets"
  s.homepage = "https://github.com/galetahub/sunrise-widgets"
  
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.test_files = Dir["{spec}/**/*"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]
  
  s.add_dependency("sunrise-cms", ">= 0.2.0")
end
