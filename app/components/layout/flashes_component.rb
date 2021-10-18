class Layout::FlashesComponent < ViewComponent::Base
  attr_reader :action_dispatch_flash

  THEMES = {
    notice: {
      flash: 'bg-blue-100 text-gray-600',
      button: 'text-blue-600 hover:text-gray-900 transition'
    },
    alert: {
      flash: 'bg-pink-100 text-gray-600',
      button: 'text-pink-700 hover:text-gray-900 transition'
    }
  }.freeze

  renders_many :flashes, Layout::FlashComponent

  def initialize(action_dispatch_flash:)
    super()
    @action_dispatch_flash = action_dispatch_flash
  end

  def notification_keys
    THEMES.keys
  end

  def render?
    any_known_keys_in_flash?
  end

  private

  def any_known_keys_in_flash?
    action_dispatch_flash.keys.map(&:to_sym).intersection(notification_keys).any?
  end
end
