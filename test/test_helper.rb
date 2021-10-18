ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ViewComponent::TestCase
  def create_component(**args)
    self.class.name.sub(/Test$/, '').constantize.new(**args)
  end

  def with_test_form(resource:, resource_name: nil, component: ViewComponent::Base.new, options: {})
    resource_name ||= to_resource_name(resource)
    form = ActionView::Helpers::FormBuilder.new(resource_name, resource, component, options)
    yield form
  end

  def to_devise_component_options(resource:, resource_name: nil, main_app: nil, devise_mapping: nil)
    resource_name ||= to_resource_name(resource)

    {
      resource: resource,
      resource_name: resource_name,
      main_app: (main_app || Rails.application.routes.url_helpers),
      devise_mapping: (devise_mapping || Devise.mappings[resource_name])
    }
  end

  def to_resource_name(resource)
    resource.class.name.downcase.to_sym
  end
end
