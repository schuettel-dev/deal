class Settings::ProfilesController < ApplicationController
  def show
    form = Settings::ProfileForm.new(current_user, params)

    if form.save
      I18n.locale = form.locale
      flash.now.notice = t('settings.profile.update.success')
    end

    render Settings::Profile::ShowComponent.new(form: form)
  end
end
