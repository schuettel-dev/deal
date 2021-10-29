class Layout::HeadingWithIconComponent < ViewComponent::Base
  attr_reader :title

  def initialize(title:, icon: nil)
    super()
    @title = title
    @icon = icon
  end

  def icon
    render Helpers::IconComponent.new(icon: @icon)
  end
end
