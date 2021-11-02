require 'test_helper'

class Helpers::LanguagePickerComponentTest < ViewComponent::TestCase
  test 'render' do
    with_request_url '/' do
      render_inline(create_component)

      assert_selector '[data-controller="helpers--dropdown"]'
      assert_selector 'button[data-action="helpers--dropdown#toggle"]'

      assert_link 'Deutsch', href: '/?locale=de'
      assert_link 'English', href: '/?locale=en'
    end
  end
end
