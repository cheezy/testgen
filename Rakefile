require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'


Cucumber::Rake::Task.new(:features, "Run features") do |t|
  t.profile = 'default'
end

task :lib do
  $LOAD_PATH.unshift(File.expand_path("lib", File.dirname(__FILE__)))
end

task :default => :features
