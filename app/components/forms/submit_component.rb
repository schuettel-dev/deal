class Forms::SubmitComponent < ViewComponent::Base
  def default_classes
    <<~STYLES.squish
      py-2 px-3 bg-blue-200 border-blue-200 w-full text-sm tracking-wide
      text-gray-800 cursor-pointer hover:border-blue-100 hover:bg-blue-100
      hover:text-gray-800 transition
    STYLES
  end
end
