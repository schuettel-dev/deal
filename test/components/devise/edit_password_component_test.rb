require 'test_helper'

class Devise::EditPasswordComponentTest < ViewComponent::TestCase
  test 'render' do
    user = User.new(reset_password_token: 'reset-token')
    render_inline(create_component(resource: user))

    assert_selector 'form' do |form|
      assert_equal '/en/users/password', form[:action]
    end

    assert_field 'Password'
    assert_field 'user_reset_password_token', type: :hidden, with: 'reset-token'
    assert_button 'Change password'
  end
end
