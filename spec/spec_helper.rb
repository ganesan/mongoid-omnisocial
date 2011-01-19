# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Configure Mongoid
Mongoid.configure do |config|
  name = "omnisocial-test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

require "mongoid-rspec"

RSpec.configure do |config|
  # Remove this line if you don't want RSpec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  config.include RSpec::Matchers
  config.include Mongoid::Matchers

  # == Mock Framework
  config.mock_with :rspec

  # clean up
  config.after :suite do
    Mongoid.master.collections.select do |collection|
      collection.name !~ /system/
    end.each(&:drop)
  end
end
