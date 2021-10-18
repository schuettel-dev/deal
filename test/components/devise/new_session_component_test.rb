require 'test_helper'

class Devise::NewSessionComponentTest < ViewComponent::TestCase
  test 'render' do
    devise_component_options = to_devise_component_options(resource: User.new)
    render_inline(create_component(**devise_component_options))

    assert_field 'Email'
    assert_field 'Password'
    assert_field 'Remember me'
    assert_button 'Sign in'

    assert_link 'Register', href: '/users/sign_up'
    assert_link 'Forgot password', href: '/users/password/new'
  end
end
