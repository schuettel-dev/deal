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
end
