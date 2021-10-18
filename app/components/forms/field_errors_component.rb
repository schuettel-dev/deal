class Forms::FieldErrorsComponent < ViewComponent::Base
  def initialize(object:, field:)
    super()
    @object = object
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
    @object.errors
  end
end
