require 'application_system_test_case'

class Devise::RegistrationsTest < ApplicationSystemTestCase
  test 'user registers' do
    visit '/'
    assert_no_link 'Sign out'
    navigate_to_registration_form

    assert_selector 'h1', text: 'Create account'

    fill_in 'Email', with: 'dwight@dundermifflin.test'
    fill_in 'Full name', with: 'Dwight Schrute'
    fill_in 'Password', with: 'dwight@dundermifflin.test'

    click_on 'Create account'

    assert_selector 'h1', text: 'Profile'
    assert_select 'Language', text: 'English'
    assert_link 'Sign out'
    assert_no_link 'Sign in'
  end

  test 'user registers in german' do
    visit '/'
    navigate_to_registration_form
    within('.language-picker') do
      click_on 'Deutsch'
    end

    fill_in 'E-Mail', with: 'dwight@dundermifflin.test'
    fill_in 'Vollständiger Name', with: 'Dwight Schrute'
    fill_in 'Passwort', with: 'dwight@dundermifflin.test'

    click_on 'Konto erstellen'
    assert_select 'Sprache', text: 'Deutsch'
  end

  test 'user enters invalid email and password' do
    visit '/'
    navigate_to_registration_form

    fill_in 'Email', with: ''
    fill_in 'Password', with: 'too-short'

    click_on 'Create account'

    assert_selector '.form-field-errors', text: "Email can't be blank"
    assert_selector '.form-field-errors', text: 'Password is too short (minimum is 10 characters)'
  end

  test 'user registers with browser' do
    using_browser do
      visit '/'
      navigate_to_registration_form

      change_language 'Deutsch'
      assert_selector 'h1', text: 'Konto erstellen'
      change_language 'English'

      find_button 'Create account', disabled: true

      fill_in 'Email', with: 'dwight@dundermifflin.test'
      find_button 'Create account', disabled: true

      fill_in 'Full name', with: 'Dwight Schrute'
      find_button 'Create account', disabled: true

      fill_in 'Password', with: 'dwight@du' # 9 characters
      find_button 'Create account', disabled: true

      fill_in 'Password', with: 'dwight@dundermifflin.test'

      click_on 'Create account'

      assert_selector 'h1', text: 'Profile'

      find('.user-menu button').click
      assert_link 'Sign out'
    end
  end

  test 'email is memorized when changing to sign in' do
    using_browser do
      visit '/'
      navigate_to_registration_form

      within('.devise--form-component') do
        fill_in 'Email', with: 'angela@dundermifflin.test'
        click_on 'Sign in'
      end

      assert_field 'Email', with: 'angela@dundermifflin.test'
    end
  end

  private

  def navigate_to_registration_form
    click_on 'Sign in'
    click_on 'Register'
  end
end
