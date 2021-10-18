require 'test_helper'

class Devise::NewPasswordComponentTest < ViewComponent::TestCase
  test 'render' do
    devise_component_options = to_devise_component_options(resource: User.new)
    render_inline(create_component(**devise_component_options))

    assert_field 'Email'
    assert_button 'Reset password'
    assert_link 'Sign in', href: '/users/sign_in'
    assert_link 'Register', href: '/users/sign_up'
  end
end
