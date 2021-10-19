class Devise::BaseComponent < ViewComponent::Base
  attr_reader :resource

  def initialize(resource:)
    super()
    @resource = resource
  end

  def minimum_password_length
    Devise.password_length.min
  end

  private

  def devise_links_for(*keys)
    devise_links.values_at(*keys)
  end

  def devise_links
    {
      sign_in: { name: t('shared.devise.sign_in'), href: new_user_session_path },
      sign_up: { name: t('shared.devise.sign_up'), href: new_user_registration_path },
      forgot_password: { name: t('shared.devise.forgot_password'), href: new_user_password_path }
    }
  end
end
