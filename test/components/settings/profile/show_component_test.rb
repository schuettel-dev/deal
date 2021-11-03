require 'test_helper'

class Settings::Profile::ShowComponentTest < ViewComponent::TestCase
  test 'render' do
    form = Settings::ProfileForm.new(users(:michael))

    with_request_url '/settings/profile' do
      render_inline(create_component(form: form))
      assert_field 'Email', with: 'michael@dundermifflin.test', disabled: true
      assert_field 'Full name', with: 'Michael Scott'
      assert_button 'Update profile'
      assert_button 'Cancel'
    end
  end

  test 'render with params' do
    params = ActionController::Parameters.new({ settings_profile: { full_name: 'Prison Mike', locale: 'de' } })
    form = Settings::ProfileForm.new(users(:michael), params)
    assert form.save

    with_request_url '/settings/profile' do
      render_inline(create_component(form: form))
      assert_field 'Full name', with: 'Prison Mike'
      assert_select 'Language', text: 'German'
    end
  end

  test 'render with form errors' do
    params = ActionController::Parameters.new({ settings_profile: { full_name: '' } })
    form = Settings::ProfileForm.new(users(:michael), params)
    assert_not form.save

    with_request_url '/settings/profile' do
      render_inline(create_component(form: form))
      assert_selector '.field_with_errors label', text: 'Full name'
      assert_field 'Full name', with: ''
      assert_selector '.form-field-errors', text: "Full name can't be blank"
    end
  end
end
