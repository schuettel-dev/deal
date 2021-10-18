class Layout::FlashComponent < ViewComponent::Base
  attr_reader :flash, :key

  def initialize(flash:, key:)
    super()
    @flash = flash
    @key = key
  end

  def render?
    flash.key?(key)
  end

  def message
    flash[key]
  end

  def flash_classes
    "flash-#{key} #{flash_theme}"
  end

  def button_classes
    "text-xs #{button_theme}"
  end

  private

  def flash_theme
    Layout::FlashesComponent::THEMES.dig(key, :flash)
  end

  def button_theme
    Layout::FlashesComponent::THEMES.dig(key, :button)
  end
end
