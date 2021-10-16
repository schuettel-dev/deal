module ApplicationHelper
  def devise_component_options
    {
      resource: resource,
      resource_name: resource_name,
      main_app: main_app,
      devise_mapping: devise_mapping
    }
  end
end
