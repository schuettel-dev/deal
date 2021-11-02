require 'application_system_test_case'

class LandingPageTest < ApplicationSystemTestCase
  test 'landing page' do
    visit '/'
    assert_link 'Sign in', href: '/users/sign_in'
  end
end
