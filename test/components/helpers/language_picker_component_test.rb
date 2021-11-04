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

  test 'current locale displays icon, en' do
    I18n.with_locale(:en) do
      with_request_url '/' do
        render_inline(create_component)
        assert_link('Deutsch') { |link| link.assert_no_selector 'svg' }
        assert_link('English') { |link| link.assert_selector 'svg' }
      end
    end
  end

  test 'current locale displays icon, de' do
    I18n.with_locale(:de) do
      with_request_url '/' do
        render_inline(create_component)
        assert_link('Deutsch') { |link| link.assert_selector 'svg' }
        assert_link('English') { |link| link.assert_no_selector 'svg' }
      end
    end
  end
end
