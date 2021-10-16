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
    !action_dispatch_flash.empty?
  end
end
