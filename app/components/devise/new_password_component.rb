class Devise::NewPasswordComponent < Devise::BaseComponent
  def links
    devise_links_for :sign_in, :sign_up
  end
end
