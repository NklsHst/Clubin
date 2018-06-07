# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.

class Application < Rails::Application
  config.time_zone = 'Berlin'
end

Rails.application.initialize!

