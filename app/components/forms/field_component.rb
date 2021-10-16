class Forms::FieldComponent < ViewComponent::Base
  attr_reader :form, :field

  def initialize(form:, field:)
    super()
    @form = form
    @field = field
  end

  def default_classes
    'focus:ring-blue-500 focus:border-blue-500 block w-full pr-10 sm:text-sm border-gray-300 rounded'
  end
end
