require 'test_helper'

class Devise::NewSessionComponentTest < ViewComponent::TestCase
  test 'render' do
    render_inline(create_component(resource: User.new))

    assert_field 'Email'
    assert_field 'Password'
    assert_field 'Remember me'
    assert_button 'Sign in'

    assert_link 'Register', href: '/users/sign_up'
    assert_link 'Forgot password', href: '/users/password/new'
  end
end
