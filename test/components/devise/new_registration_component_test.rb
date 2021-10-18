require 'test_helper'

class Devise::NewRegistrationComponentTest < ViewComponent::TestCase
  test 'render' do
    devise_component_options = to_devise_component_options(resource: User.new)
    render_inline(create_component(**devise_component_options))

    assert_field 'Email'
    assert_field 'Password'
    assert_button 'Create account'
    assert_link 'Sign in', href: '/users/sign_in'
  end
end
