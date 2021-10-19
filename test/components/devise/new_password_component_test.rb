require 'test_helper'

class Devise::NewPasswordComponentTest < ViewComponent::TestCase
  test 'render' do
    render_inline(create_component(resource: User.new))

    assert_field 'Email'
    assert_button 'Reset password'
    assert_link 'Sign in', href: '/en/users/sign_in'
    assert_link 'Register', href: '/en/users/sign_up'
  end
end
