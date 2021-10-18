require 'test_helper'

class Layout::FlashesComponentTest < ViewComponent::TestCase
  test 'renders notice' do
    action_dispatch_flash = ActionDispatch::Flash::FlashHash.new(notice: 'This is a notice')
    render_inline(create_component(action_dispatch_flash: action_dispatch_flash))

    assert_selector '.flash.flash-notice', text: 'This is a notice'
    assert_selector '.flash', count: 1
  end

  test 'renders alert' do
    action_dispatch_flash = ActionDispatch::Flash::FlashHash.new(alert: 'This is an alert')
    render_inline(create_component(action_dispatch_flash: action_dispatch_flash))

    assert_selector '.flash.flash-alert', text: 'This is an alert'
    assert_selector '.flash', count: 1
  end

  test 'renders notice and alert' do
    action_dispatch_flash = ActionDispatch::Flash::FlashHash.new(notice: 'One for notice',
                                                                 alert: 'The other for alert')
    render_inline(create_component(action_dispatch_flash: action_dispatch_flash))

    assert_selector '.flash.flash-notice', text: 'One for notice'
    assert_selector '.flash.flash-alert', text: 'The other for alert'
    assert_selector '.flash', count: 2
  end

  test 'does not render other' do
    action_dispatch_flash = ActionDispatch::Flash::FlashHash.new(unknown: 'Unknown key')
    render_inline(create_component(action_dispatch_flash: action_dispatch_flash))

    assert_equal '', page.text.chomp
  end
end
