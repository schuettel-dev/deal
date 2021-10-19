require 'test_helper'

class Settings::ProfileControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    sign_in_as(:michael)
    get settings_profile_path
    assert_response :success
  end
end
