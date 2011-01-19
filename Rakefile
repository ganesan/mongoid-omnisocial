require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "omnisocial"
  gem.homepage = "http://github.com/carhartl/mongoid-omnisocial"
  gem.license = "MIT"
  gem.summary = %Q{Twitter and Facebook logins for your Rails application using Mongoid.}
  gem.description = %Q{Twitter and Facebook logins for your Rails application using Mongoid. Based on OmniSocial: https//github.com/icelab/omnisocial }
  gem.email = "klaus.hartl@gmail.com"
  gem.authors = ["Klaus Hartl"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
  gem.add_runtime_dependency 'oa-core',     '~> 0.1.2'
  gem.add_runtime_dependency 'oa-oauth',    '~> 0.1.2'
  gem.add_runtime_dependency 'bcrypt-ruby', '~> 2.1'
  gem.add_runtime_dependency 'mongoid', '2.0.0.rc.5'
  gem.add_runtime_dependency 'mongo', '1.1.5'
  gem.add_runtime_dependency 'bson_ext', '1.2.0'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'mongoid-rspec'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "omnisocial #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
