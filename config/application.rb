require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EmployeeManagement
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Configure host authorization
    config.hosts = [
      IPAddr.new("10.0.0.0/8"),
      /.*\.cncsites\.com\z/,
      /.*\.coherence-app\.com\z/  # Added Coherence domain
    ]

    # Allow all hosts in development environment
    if Rails.env.development?
      config.hosts.clear
    end

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Allow requests from all hosts (use with caution, preferably only in development)
    config.action_dispatch.default_headers = {
      'X-Frame-Options' => 'ALLOWALL'
    }

    # Set the port for the server
    config.port = ENV.fetch("PORT", 8080)
  end
end