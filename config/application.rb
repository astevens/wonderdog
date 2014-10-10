require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WonderDog
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
    config.session_store :disabled

    config.middleware.delete 'Rack::Lock'
    config.middleware.delete 'Rack::ETag'
    config.middleware.delete 'Rack::Sendfile'
    config.middleware.delete 'Rack::ConditionalGet'
    config.middleware.delete 'ActionDispatch::Flash'
    config.middleware.delete 'ActionDispatch::BestStandardsSupport'
    config.middleware.delete 'ActionDispatch::Cookies'
    config.middleware.delete 'ActionDispatch::Session::CookieStore'

    config.filter_parameters += [:password]
    config.action_controller.perform_caching = false
    config.autoload_paths = [Rails.root + 'app']
  end
end

DB = Mysql2::Client.new(
  :database => 'vcx',
  :username => 'connection',
  :password => 'howdy123',
  :host => 'dev.cwfqp5ujvksm.us-east-1.rds.amazonaws.com',
  :symbolize_keys => true
  )
