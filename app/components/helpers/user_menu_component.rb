class Helpers::UserMenuComponent < ViewComponent::Base
  attr_reader :current_user

  def initialize(current_user:)
    super()
    @current_user = current_user
  end
end
