require 'test_helper'

class Layout::FlashComponentTest < ViewComponent::TestCase
  test 'render notice' do
    flash = ActionDispatch::Flash::FlashHash.new(notice: 'This is a notice')
    render_inline(create_component(flash: flash, key: :notice))

    assert_selector '.flash.flash-notice', text: 'This is a notice'
    assert_button 'Dismiss'
  end

  test 'render alert' do
    flash = ActionDispatch::Flash::FlashHash.new(alert: 'This is an alert')
    render_inline(create_component(flash: flash, key: :alert))

    assert_selector '.flash.flash-alert', text: 'This is an alert'
    assert_button 'Dismiss'
  end

  test 'render other' do
    flash = ActionDispatch::Flash::FlashHash.new(other: 'This is other')
    render_inline(create_component(flash: flash, key: :other))

    assert_selector '.flash.flash-other', text: 'This is other'
    assert_button 'Dismiss'
  end

  test 'does not render if key does not exist in flash' do
    flash = ActionDispatch::Flash::FlashHash.new(notice: 'The key is a notice')
    render_inline(create_component(flash: flash, key: :alert))

    assert_equal '', page.text
  end
end
