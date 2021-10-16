class Forms::CheckBoxComponent < ViewComponent::Base
  attr_reader :form, :field

  def initialize(form:, field:)
    super()
    @form = form
    @field = field
  end
end
