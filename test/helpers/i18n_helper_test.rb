require 'test_helper'

class I18nHelperTest < ActiveSupport::TestCase
  test '.local_available_locales_options for :en' do
    I18n.with_locale(:en) do
      assert_equal(
        [['English', :en], ['German', :de]],
        I18nHelper.local_available_locales_options
      )
    end
  end

  test '.local_available_locales_options for :de' do
    I18n.with_locale(:de) do
      assert_equal(
        [['Deutsch', :de], ['Englisch', :en]],
        I18nHelper.local_available_locales_options
      )
    end
  end

  test '.global_available_locales_options' do
    assert_equal(
      [['Deutsch', :de], ['English', :en]],
      I18nHelper.global_available_locales_options
    )
  end
end
