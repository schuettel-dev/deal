require 'test_helper'

class Layout::MainNavigationComponentTest < ViewComponent::TestCase
  test 'render, user not signed in' do
    render_inline(create_component(user_signed_in: false))
    assert_link 'Sign in'
  end

  test 'render, user signed in' do
    render_inline(create_component(user_signed_in: true))
    assert_link 'Sign out'
  end
end
