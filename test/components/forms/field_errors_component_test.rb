require 'test_helper'

class Forms::FieldErrorsComponentTest < ViewComponent::TestCase
  test 'renders with errors' do
    user = User.new
    user.validate

    render_inline(create_component(object: user, field: :email))

    assert_selector '.form-field-errors', text: "Email can't be blank"
  end

  test 'does not render without errors' do
    user = User.new

    render_inline(create_component(object: user, field: :email))

    assert_equal '', page.text
  end
end
