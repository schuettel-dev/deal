require 'application_system_test_case'

class Devise::SignInsTest < ApplicationSystemTestCase
  test 'user signs in' do
    visit '/'
    assert_no_link 'Sign out'
    click_on 'Sign in'
    sign_in_as(:michael)
    assert_selector '.flash-notice', text: 'Signed in successfully.'
    assert_selector 'h1', text: 'Landing Page'
    assert_link 'Sign out'
    assert_no_link 'Sign in'
  end

  test 'user enters invalid email and password' do
    visit '/'
    click_on 'Sign in'

    within 'form' do
      fill_in 'Email', with: 'does-not-exist@dundermifflin.test'
      fill_in 'Password', with: 'does-not-matter'
      click_on 'Sign in'
    end

    assert_selector '.flash-alert', text: 'Invalid Email or password'
  end

  test 'user enters wrong credentials' do
    sign_in_as(:michael, 'wrong-password')
    assert_selector '.flash-alert', text: 'Invalid Email or password'
  end

  test 'email is memorized when changing to Register' do
    using_browser do
      visit '/'
      click_on 'Sign in'
      within('.devise--form-component') do
        fill_in 'Email', with: 'oscar@dundermifflin.test'
        click_on 'Register'
      end

      assert_selector 'h1', text: 'Create account'
      assert_field 'Email', with: 'oscar@dundermifflin.test'
    end
  end

  test 'email is memorized when changing to Forgot password' do
    using_browser do
      visit '/'
      click_on 'Sign in'
      within('.devise--form-component') do
        fill_in 'Email', with: 'ryan@dundermifflin.test'
        click_on 'Forgot password'
      end

      assert_selector 'h1', text: 'Forgot password'
      assert_field 'Email', with: 'ryan@dundermifflin.test'
    end
  end
end
