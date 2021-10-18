require 'test_helper'

class Devise::FormComponentTest < ViewComponent::TestCase
  test 'render' do
    render_inline(create_component) do |component|
      component.title { 'The title' }
      component.form { '[FORM BODY]' }
      component.links([
                        { name: 'Foo', href: '/foo' },
                        { name: 'Bar', href: '/bar' }
                      ])
    end

    assert_selector '.devise--form-component'
    assert_selector '.devise--form-component--title', text: 'The title'
    assert_selector '.devise--form-component--form', text: '[FORM BODY]'
    assert_link 'Foo', href: '/foo'
    assert_link 'Bar', href: '/bar'
  end
end
