require 'test_helper'

class Forms::CheckBoxComponentTest < ViewComponent::TestCase
  test 'render, unchecked' do
    with_test_form(resource: User.new) do |form|
      render_inline(create_component(form: form, field: :remember_me))
    end

    assert_field 'Remember me' do |checkbox|
      assert_not checkbox[:checked], 'Checkbox should NOT be checked'
    end
  end

  test 'render, checked' do
    user = User.new(remember_me: true)

    with_test_form(resource: user) do |form|
      render_inline(create_component(form: form, field: :remember_me))
    end

    assert_field 'Remember me' do |checkbox|
      assert checkbox[:checked], 'Checkbox should be checked'
    end
  end
end
