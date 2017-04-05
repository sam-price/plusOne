require_relative 'boot'
require 'rails/all'
require "redis"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlusOne
  class Application < Rails::Application
    # Added to allow for enum data type and schema show up
    # For the schema at the end - going to remove it for now
    # config.active_record.schema_format = :sql

    redis = Redis.new

  end
end
