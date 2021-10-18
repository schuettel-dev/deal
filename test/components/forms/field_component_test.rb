require 'test_helper'

class Forms::FieldComponentTest < ViewComponent::TestCase
  test 'render without field errors' do
    with_test_form(resource: User.new) do |form|
      render_inline(create_component(form: form, field: :email)) do
        form.email_field :email
      end

      assert_selector 'label', text: 'Email'
      assert_field 'Email'
      assert_selector '.form--field-errors', count: 0
    end
  end

  test 'render with field errors' do
    user = User.new
    user.validate

    with_test_form(resource: user) do |form|
      render_inline(create_component(form: form, field: :email)) do
        form.email_field :email
      end

      assert_selector 'label', text: 'Email'
      assert_field 'Email'
      assert_selector '.form--field-errors', text: "Email can't be blank"
    end
  end
end
