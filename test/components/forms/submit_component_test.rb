require 'test_helper'

class Forms::SubmitComponentTest < ViewComponent::TestCase
  test 'render simple' do
    with_test_form(resource: User.new) do |form|
      render_inline(create_component(form: form, text: 'Submit it!'))
      assert_button 'Submit it!' do |button|
        assert_match /bg-blue-200/, button[:class]
        assert_no_match /custom-class/, button[:class]
      end
    end
  end

  test 'render custom classes' do
    with_test_form(resource: User.new) do |form|
      render_inline(create_component(form: form, text: 'Submit it!', class: 'custom-class'))
      assert_button 'Submit it!' do |button|
        assert_no_match /bg-blue-200/, button[:class]
        assert_match /custom-class/, button[:class]
      end
    end
  end

  test 'render custom classes, and options' do
    with_test_form(resource: User.new) do |form|
      render_inline(create_component(form: form, text: 'Submit it!', class: 'custom-class', 'data-thing': 'data-value'))
      assert_button 'Submit it!' do |button|
        assert_equal 'data-value', button[:'data-thing']
      end
    end
  end
end
