require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :rack_test

  def using_browser(&block)
    driver = ENV['DEBUG'].present? ? :selenium : :selenium_headless
    Capybara.using_driver(driver, &block)
  end

  def sign_in_as(fixture_key, password = '1234567890', locale: I18n.default_locale)
    user = users(fixture_key)
    visit new_user_session_path(locale: locale)
    within 'form' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: password
      check 'Remember me'
      click_on 'Sign in'
    end
  end

  def change_language(locale_name)
    within('.language-picker') do
      find('button').click
      click_on locale_name
    end
  end
end
