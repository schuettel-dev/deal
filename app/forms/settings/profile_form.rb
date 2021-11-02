class Settings::ProfileForm
  include ActiveModel::Model

  delegate :errors, :persisted?, :to_param, to: :@object

  def initialize(object, params = {})
    @object = object
    @params = params
  end

  def save
    @object.update(profile_params) if profile_params.present?
  end

  def email
    @object.email
  end

  def full_name
    profile_params&.dig(:full_name) || @object.full_name
  end

  def locale
    profile_params&.dig(:locale) || @object.locale
  end

  def model_name
    ActiveModel::Name.new(self, nil, 'Settings::Profile')
  end

  private

  def profile_params
    @params[:settings_profile]&.permit(:full_name, :locale)
  end
end
