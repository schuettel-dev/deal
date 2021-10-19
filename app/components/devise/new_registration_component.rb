class Devise::NewRegistrationComponent < Devise::BaseComponent
  def links
    devise_links_for :sign_in
  end
end
