class Forms::FieldErrorsComponent < ViewComponent::Base
  def initialize(form:, field:)
    super()
    @form = form
    @field = field
  end

  def render?
    errors.key?(@field)
  end

  def full_error_messages
    errors.full_messages_for(@field).join(', ')
  end

  private

  def errors
    @form.object.errors
  end
end
