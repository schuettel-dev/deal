class Helpers::LanguagePickerLinkComponent < ViewComponent::Base
  attr_reader :locale_name, :locale_key

  with_collection_parameter :locale_option

  def initialize(locale_option:)
    super()
    @locale_name, @locale_key = locale_option
  end

  def current_locale?
    I18n.locale == @locale_key
  end
end
