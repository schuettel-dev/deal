class Devise::NewSessionComponent < Devise::BaseComponent
  def links
    [
      { name: t('shared.devise.register'), href: new_registration_path(resource_name) },
      { name: t('shared.devise.forgot_password'), href: new_password_path(resource_name) }
    ]
  end
end
