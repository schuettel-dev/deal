class UserDecorator < SimpleDelegator
  def initialize(object) # rubocop:disable Lint/MissingSuper
    @object = object
  end

  def initials
    @object.full_name.to_s.split.first(2).map { |string| string[0].upcase }.join
  end
end
