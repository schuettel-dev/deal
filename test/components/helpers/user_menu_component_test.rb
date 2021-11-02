require 'test_helper'

class Helpers::UserMenuComponentTest < ViewComponent::TestCase
  test 'render' do
    render_inline(create_component(current_user: users(:michael)))
    assert_selector 'button[data-action="helpers--dropdown#toggle"]'
    assert_link 'Profile', href: '/settings/profile'
    assert_link 'Sign out', href: '/users/sign_out'
  end
end
