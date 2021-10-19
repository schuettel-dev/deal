ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def sign_in_as(fixture_key)
    sign_in users(fixture_key)
  end
end

class ActionDispatch::IntegrationTest
  setup do
    @default_url_options_locale_before = app.default_url_options[:locale]
    app.default_url_options[:locale] = I18n.locale
  end

  teardown do
    app.default_url_options[:locale] = @default_url_options_locale_before
  end
end

class ViewComponent::TestCase
  def create_component(**args)
    self.class.name.sub(/Test$/, '').constantize.new(**args)
  end
end
