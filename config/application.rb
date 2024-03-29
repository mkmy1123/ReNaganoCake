require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Naganocake
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.generators.template_engine = :slim

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Tokyo'
    Time::DATE_FORMATS[:datetime_jp] = '%Y/%m/%d %H:%M:%S'
    Time::DATE_FORMATS[:date_jp] = '%Y/%m/%d'
    Time::DATE_FORMATS[:dateweek_jp] = '%Y/%m/%d %a %H:%M'
  end
end
