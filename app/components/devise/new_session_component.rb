class Devise::NewSessionComponent < Devise::BaseComponent
  def links
    devise_links_for :sign_up, :forgot_password
  end
end
