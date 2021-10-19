require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create user' do
    user = User.new(email: 'creed@dundermifflin.test', full_name: 'Creed Bratton', password: '1234567890')
    assert user.save!
  end
end
