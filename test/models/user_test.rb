require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create user' do
    user = User.new(email: 'creed@dundermifflin.test', full_name: 'Creed Bratton', password: '1234567890')
    assert user.save!
    assert_equal 'en', user.locale
  end

  test '#initialize_locale' do
    I18n.with_locale(:de) do
      user = User.new
      user.validate
      assert_equal 'de', user.locale
    end
  end

  test 'validates' do
    user = User.new(locale: 'foo')
    assert_not user.valid?

    assert_includes user.errors.full_messages_for(:email), "Email can't be blank"
    assert_includes user.errors.full_messages_for(:full_name), "Full name can't be blank"
    assert_includes user.errors.full_messages_for(:password), "Password can't be blank"
    assert_includes user.errors.full_messages_for(:locale), 'Language is not included in the list'
  end
end
