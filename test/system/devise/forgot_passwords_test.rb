require 'application_system_test_case'

class Devise::ForgotPasswordsTest < ApplicationSystemTestCase
  test 'user resets password' do
    navigate_to_forgot_password
    assert_selector 'h1', text: 'Forgot password'
    fill_in 'Email', with: 'michael@dundermifflin.test'
    click_on 'Reset password'
    assert_selector '.flash-notice',
                    text: 'You will receive an email with instructions on how to reset your password in a few minutes.'
  end

  test 'user enters no email' do
    navigate_to_forgot_password
    fill_in 'Email', with: ''
    click_on 'Reset password'
    assert_selector '.form--field-errors', text: "Email can't be blank"
  end

  test 'users enters non-existing email' do
    navigate_to_forgot_password
    fill_in 'Email', with: 'does-not-exist@dundermifflin.test'
    click_on 'Reset password'
    assert_selector '.form--field-errors', text: 'Email not found'
  end

  test 'email is memorized when changing to Sign in' do
    using_browser do
      navigate_to_forgot_password

      within('.devise--form-component') do
        fill_in 'Email', with: 'stanley@dundermifflin.test'
        click_on 'Sign in'
      end

      assert_selector 'h1', text: 'Sign in'
      assert_field 'Email', with: 'stanley@dundermifflin.test'
    end
  end

  test 'email is memorized when changing to Register' do
    using_browser do
      navigate_to_forgot_password

      within('.devise--form-component') do
        fill_in 'Email', with: 'kevin@dundermifflin.test'
        click_on 'Register'
      end

      assert_selector 'h1', text: 'Create account'
      assert_field 'Email', with: 'kevin@dundermifflin.test'
    end
  end

  private

  def navigate_to_forgot_password
    visit '/'
    click_on 'Sign in'
    click_on 'Forgot password'
  end
end
