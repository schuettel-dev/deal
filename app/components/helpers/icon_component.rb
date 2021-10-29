class Helpers::IconComponent < ViewComponent::Base
  def initialize(icon:)
    super()
    @icon = icon
  end

  def call
    Rails.root.join("app/assets/images/#{@icon}").read.html_safe # rubocop:disable Rails/OutputSafety
  end
end
