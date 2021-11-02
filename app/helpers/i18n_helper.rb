module I18nHelper
  module_function

  def local_available_locales_options
    I18n.available_locales.map do |locale|
      [human_available_locale(locale), locale]
    end.sort_by(&:first)
  end

  def global_available_locales_options
    I18n.available_locales.map do |locale|
      I18n.with_locale(locale) do
        [human_available_locale(locale), locale]
      end
    end.sort_by(&:first)
  end

  def human_available_locale(locale)
    I18n.t('shared.locales')[locale]
  end
end
