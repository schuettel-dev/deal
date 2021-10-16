class Devise::NewRegistrationComponent < Devise::BaseComponent
  def links
    [
      { name: t('shared.devise.sign_in'), href: new_session_path(resource_name) }
    ]
  end
end
