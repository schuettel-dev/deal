require 'application_system_test_case'

class Settings::ProfileTest < ApplicationSystemTestCase
  test 'changes profile' do
    sign_in_as(:michael)
    within('.user-menu') { click_on 'Profile' }

    fill_in 'Full name', with: 'Prison Mike'
    select 'German', from: 'Language'
    click_on 'Update profile'

    assert_selector '.flash-notice', text: 'Profil gespeichert.'

    assert_field 'Vollständiger Name', with: 'Prison Mike'
    assert_select 'Sprache', text: 'Deutsch'
  end

  test 'form tracks changes' do
    using_browser do
      sign_in_as(:michael)

      within('.user-menu') do
        find('button').click
        click_on 'Profile'
      end

      assert_buttons_hidden_and_disabled

      find_field('Full name').send_keys('s')
      assert_buttons_displayed_and_enabled

      find_field('Full name').send_keys(:backspace)
      assert_buttons_hidden_and_disabled

      select 'German', from: 'Language'
      assert_buttons_displayed_and_enabled

      select 'English', from: 'Language'
      assert_buttons_hidden_and_disabled
    end
  end

  test 'reset form' do
    using_browser do
      sign_in_as(:michael)

      within('.user-menu') do
        find('button').click
        click_on 'Profile'
      end

      assert_buttons_hidden_and_disabled

      fill_in 'Full name', with: 'Prison Mike'
      select 'German', from: 'Language'

      assert_buttons_displayed_and_enabled

      click_on 'Cancel'

      assert_field 'Full name', with: 'Michael Scott'
      assert_select 'Language', text: 'English'
    end
  end

  private

  def assert_buttons_hidden_and_disabled
    assert_no_button 'Cancel'
    assert_button 'Update profile', disabled: true
  end

  def assert_buttons_displayed_and_enabled
    assert_button 'Cancel'
    assert_button 'Update profile'
  end
end
