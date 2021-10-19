class Layout::HeadingWithIconComponent < ViewComponent::Base
  attr_reader :title

  def initialize(title:, icon: nil)
    super()
    @title = title
    @icon = icon
  end

  def inline_icon
    Rails.root.join("app/assets/images/#{@icon}").read.html_safe # rubocop:disable Rails/OutputSafety
  end
end
