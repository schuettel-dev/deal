require 'application_system_test_case'

class Devise::ForgotPasswordsTest < ApplicationSystemTestCase
  include ActionMailer::TestHelper

  test 'user resets password' do
    navigate_to_forgot_password
    assert_selector 'h1', text: 'Forgot password'
    fill_in 'Email', with: 'michael@dundermifflin.test'
    assert_emails 1 do
      click_on 'Reset password'
    end
    assert_selector '.flash-notice',
                    text: 'You will receive an email with instructions on how to reset your password in a few minutes.'

    email = ActionMailer::Base.deliveries.last
    assert_equal ['michael@dundermifflin.test'], email.to
    email_body = Nokogiri::HTML(email.body.to_s)
    assert_match /Someone has requested a link to change your password/, email_body
    reset_password_url = email_body.css('a').first[:href]

    visit reset_password_url
    assert_selector 'h1', text: 'Change password'
    fill_in 'Password', with: '0123456789'
    click_on 'Change password'

    assert_selector '.flash-notice', text: 'Your password has been changed successfully. You are now signed in.'
  end

  test 'user enters no email' do
    navigate_to_forgot_password
    fill_in 'Email', with: ''
    click_on 'Reset password'
    assert_selector '.form-field-errors', text: "Email can't be blank"
  end

  test 'users enters non-existing email' do
    navigate_to_forgot_password
    fill_in 'Email', with: 'does-not-exist@dundermifflin.test'
    click_on 'Reset password'
    assert_selector '.form-field-errors', text: 'Email not found'
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
