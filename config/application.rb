# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AIclinix
  # Application
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: ['assets', 'tasks'])

    # Settings in config/environments/* take precedence over those specified here.
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :fr]

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # Set UUID as Default Primary Key
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

    # Set Sidekiq as Active Job Queue Adapter
    config.active_job.queue_adapter = :sidekiq

    # Use slim as the template engine
    config.generators.template_engine = :slim
  end
end
