require 'test_helper'

class Devise::NewRegistrationComponentTest < ViewComponent::TestCase
  test 'render' do
    component = Devise::NewRegistrationComponent.new(resource: User.new)
    render_inline(component)

    assert_field 'Email'
    assert_field 'Password'
    assert_button 'Create account'
    assert_link 'Sign in', href: '/en/users/sign_in'
  end
end
