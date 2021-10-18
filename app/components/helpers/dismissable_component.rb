class Helpers::DismissableComponent < ViewComponent::Base
  renders_one :dismiss_button, 'DismissButtonComponent'

  class DismissButtonComponent < ViewComponent::Base
    attr_reader :classes

    def initialize(classes: nil)
      super()
      @classes = classes
    end

    def call
      tag.button(content.chomp, class: classes, 'data-action': 'helpers--dismissable#dismiss')
    end
  end
end
