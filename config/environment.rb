# Load the Rails application.
##require_relative "application"
# Initialize the Rails application.
##Rails.application.initialize!
# config/application.rb
require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Lucas11PersonalBlog
  class Application < Rails::Application
    config.load_defaults 7.0
  end
end