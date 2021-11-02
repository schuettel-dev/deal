require 'test_helper'

class Layout::HeaderComponentTest < ViewComponent::TestCase
  test 'render, user not signed in' do
    with_request_url '/' do
      render_inline(create_component(user_signed_in: false))
      assert_link 'Deutsch', href: '/?locale=de'
      assert_link 'English', href: '/?locale=en'
    end
  end

  test 'render, user signed in' do
    with_request_url '/' do
      render_inline(create_component(user_signed_in: true))
      assert_link 'Sign out'
    end
  end
end
