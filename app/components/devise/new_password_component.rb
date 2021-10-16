class Devise::NewPasswordComponent < Devise::BaseComponent
  def links
    [
      { name: t('shared.devise.sign_in'), href: new_session_path(resource_name) },
      { name: t('shared.devise.register'), href: new_registration_path(resource_name) }
    ]
  end
end
