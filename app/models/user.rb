class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :initialize_locale, if: :new_record?

  validates :full_name, presence: true
  validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }

  def decorate
    @decorate ||= UserDecorator.new(self)
  end

  private

  def initialize_locale
    self.locale ||= I18n.locale
  end
end
