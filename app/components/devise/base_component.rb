class Devise::BaseComponent < ViewComponent::Base
  attr_reader :resource, :resource_name, :main_app, :devise_mapping

  def initialize(devise_component_options)
    super()
    @resource = devise_component_options[:resource]
    @resource_name = devise_component_options[:resource_name]
    @main_app = devise_component_options[:main_app]
    @devise_mapping = devise_component_options[:devise_mapping]
  end

  def minimum_password_length
    Devise.password_length.min
  end
end
