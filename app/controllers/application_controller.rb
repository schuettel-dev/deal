class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    locale = current_user.try(:locale) || find_locale_in_session || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def after_sign_in_path_for(_resource)
    settings_profile_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name locale])
  end

  def find_locale_in_session
    session[:locale] = params[:locale] || session[:locale]
  end
end
