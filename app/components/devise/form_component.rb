class Devise::FormComponent < ViewComponent::Base
  renders_one :title
  renders_one :form
  renders_many :links, 'LinkComponent'

  class LinkComponent < ViewComponent::Base
    attr_reader :name, :href

    def initialize(name:, href:)
      super()
      @name = name
      @href = href
    end

    def call
      link_to name, href, class: 'text-gray-400 hover:text-blue-500 transition text-xs inline-block mx-auto'
    end
  end
end
