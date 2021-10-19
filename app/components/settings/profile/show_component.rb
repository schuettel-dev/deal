class Settings::Profile::ShowComponent < ViewComponent::Base
  attr_reader :form

  def initialize(form:)
    super()
    @form = form
  end

  def user
    form.object
  end
end
