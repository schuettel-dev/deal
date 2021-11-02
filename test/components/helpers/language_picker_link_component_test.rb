require 'test_helper'

class Helpers::LanguagePickerLinkComponentTest < ViewComponent::TestCase
  test 'render, not current_locale' do
    I18n.with_locale(:en) do
      with_request_url '/' do
        render_inline(create_component(locale_option: ['Francais', :fr]))
        assert_no_selector 'svg'
        assert_link 'Francais', href: '/?locale=fr'
      end
    end
  end

  test 'render, current_locale' do
    I18n.with_locale(:en) do
      with_request_url '/' do
        render_inline(create_component(locale_option: ['English', :en]))
        assert_selector 'svg'
        assert_link 'English', href: '/?locale=en'
      end
    end
  end
end
