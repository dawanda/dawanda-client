require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

task :default => :test

spec = Gem::Specification.new do |s|
  s.name             = 'dawamda'
  s.version          = '0.1.0'
  s.has_rdoc         = true
  s.extra_rdoc_files = %w(README.rdoc)
  s.rdoc_options     = %w(--main README.rdoc)
  s.summary          = "Provides a friendly ruby-like interface to the Dawanda API"
  s.author           = 'Christoph Bünte'
  s.email            = 'info@christophbuente.de'
  s.homepage         = 'http://www.christophbuente.de'
  s.files            = %w(README.rdoc Rakefile) + Dir.glob("{lib,test}/**/*")
  # s.executables    = ['dawanda']
  
  s.add_dependency('json', '~> 1.1.0')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

desc 'Generate the gemspec to serve this Gem from Github'
task :github do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end

namespace :doc do

  desc 'generate doc'
  task :generate do
    `rdoc`
  end
  
  desc 'clean up all docs'
  task :clean do
    `rm -fr doc`
  end
  
  desc 'open docs in browser'
  task :open do
    `open doc/index.html`
  end
end
