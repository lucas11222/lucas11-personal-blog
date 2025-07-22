# Load the Rails application.
require_relative "application"
puts "🔍 RAILS_MASTER_KEY=#{ENV['RAILS_MASTER_KEY']&.slice(0, 5)}..."
# Initialize the Rails application.
Rails.application.initialize!
