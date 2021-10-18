require 'test_helper'

class Helpers::DismissableComponentTest < ViewComponent::TestCase
  test 'render' do
    render_inline(create_component) do |component|
      component.tag.div('This is dismissable') +
        component.dismiss_button(classes: 'custom-class').with_content('Remove me').to_s
    end

    assert_selector '[data-controller="helpers--dismissable"]', text: 'This is dismissable'
    assert_button 'Remove me' do |button|
      assert_match /custom-class/, button[:class]
      assert_equal 'helpers--dismissable#dismiss', button[:'data-action']
    end
  end
end
