require 'test_helper'

class Layout::HeaderComponentTest < ViewComponent::TestCase
  test 'render, user not signed in' do
    with_request_url '/' do
      render_inline(create_component(current_user: nil))
      assert_link 'Deutsch', href: '/?locale=de'
      assert_link 'English', href: '/?locale=en'
    end
  end

  test 'render, user signed in' do
    with_request_url '/' do
      render_inline(create_component(current_user: users(:michael)))
      assert_link 'Sign out'
    end
  end
end
