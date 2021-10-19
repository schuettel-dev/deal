class Settings::ProfilesController < ApplicationController
  def show
    form = Settings::ProfileForm.new(current_user, params)

    flash.now.notice = t('settings.profile.update.success') if form.save

    render Settings::Profile::ShowComponent.new(form: form)
  end
end
