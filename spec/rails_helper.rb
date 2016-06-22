ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'

require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Formulaic::Dsl, type: :feature

  config.include ActiveSupport::Testing::TimeHelpers

  config.include FactoryGirl::Syntax::Methods

  config.include Warden::Test::Helpers

  config.before :suite do
    Warden.test_mode!
  end

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.backtrace_exclusion_patterns << /gems/
end
