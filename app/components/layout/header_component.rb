class Layout::HeaderComponent < ViewComponent::Base
  attr_reader :current_user

  def initialize(current_user:)
    super()
    @current_user = current_user
  end

  def user_signed_in?
    current_user.present?
  end
end
