# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "testgen/version"

Gem::Specification.new do |s|
  s.name        = "testgen"
  s.version     = TestGen::VERSION
  s.authors     = ["Jeffrey S. Morgan"]
  s.email       = ["jeff.morgan@leandog.com"]
  s.homepage    = "http://github.com/cheezy/testgen"
  s.summary     = %q{Generators for testers using Cucumber}
  s.description = %q{A collection of generators build things for testers using Cucumber}

  s.rubyforge_project = "testgen"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'thor', '>=0.14.6'
  s.add_dependency 'cucumber', '>=1.0.0'
  s.add_dependency 'rspec', '>=2.6.0'

  s.add_development_dependency 'aruba'
end
