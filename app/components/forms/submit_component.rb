class Forms::SubmitComponent < ViewComponent::Base
  DEFAULT_CLASSES = <<~STYLES.squish
    py-2 px-3 bg-blue-200 border-blue-200 w-full text-sm tracking-wide
    text-gray-800 cursor-pointer hover:border-blue-100 hover:bg-blue-100
    hover:text-gray-800 transition
  STYLES

  attr_reader :form, :text, :classes, :opts

  def initialize(form:, text:, **opts)
    super()
    @form = form
    @text = text
    @classes = opts.delete(:class) || DEFAULT_CLASSES
    @opts = opts
  end

  def call
    form.submit text, class: classes, **opts
  end
end
