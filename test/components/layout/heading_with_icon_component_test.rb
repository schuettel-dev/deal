require 'test_helper'

class Layout::HeadingWithIconComponentTest < ViewComponent::TestCase
  test 'render' do
    render_inline(create_component(title: 'Profile', icon: 'svgs/user.svg'))

    assert_selector 'h1', text: 'Profile'
    assert_selector 'svg', count: 1
  end

  test 'raises if icon does not exist' do
    assert_raises(Errno::ENOENT) do
      render_inline(create_component(title: 'Foo', icon: 'should_not_exist.svg'))
    end
  end
end
